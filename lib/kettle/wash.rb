# frozen_string_literal: true

require "version_gem"
require_relative "wash/version"

Kettle::Wash::Version.class_eval do
  extend VersionGem::Basic
end

module Kettle
  module Wash
    class Error < StandardError; end

    class << self
      def install(owner, config = nil, constants: nil, path: nil)
        constants, path = normalize_config(config, constants: constants, path: path)
        owner.extend(Change::ConstantChange.to_mod(constants: constants, path: path))
        nil
      end

      def validate!(owner, config = nil, constants: nil, path: nil)
        constants, path = normalize_config(config, constants: constants, path: path)
        missing = constants.reject { |constant_name| owner.const_defined?(constant_name, false) }
        raise Error, "Missing washable constant(s): #{missing.join(", ")}" unless missing.empty?
        raise Error, "Washable constants path does not exist: #{path}" unless File.file?(path)

        true
      end

      def delete_constants(owner, constants)
        Array(constants).each do |constant_name|
          owner.send(:remove_const, constant_name) if owner.const_defined?(constant_name, false)
        end
        nil
      end

      def reset_constants(owner:, constants:, path:)
        delete_constants(owner, constants)
        load(path)
        nil
      end

      private

      def normalize_config(config, constants:, path:)
        config ||= {}
        if config.respond_to?(:fetch)
          constants ||= config.fetch(:constants) { config.fetch("constants", nil) }
          path ||= config.fetch(:path) { config.fetch("path", nil) }
        end

        constants = Array(constants)
        raise Error, "No washable constants configured" if constants.empty?
        raise Error, "No washable constants path configured" if path.nil? || path.to_s.empty?

        [constants, path.to_s]
      end
    end

    class Change < Module
      def initialize(constants: nil, path: nil)
        super()
        @constants = Array(constants) if constants
        @path = path if path
      end

      def included(base)
        constants = @constants
        path = @path
        return unless constants && path

        base.extend(ConstantChange.to_mod(constants: constants, path: path))
      end

      module ConstantChange
        class << self
          def to_mod(constants:, path:)
            Module.new do
              define_method(:delete_const) do |*_args, &block|
                Kettle::Wash.delete_constants(self, constants)
                block&.call
                nil
              end

              define_method(:reset_const) do |*_args, &block|
                delete_const do
                  block&.call
                  load(path)
                end
              end
            end
          end
        end
      end
    end
  end
end
