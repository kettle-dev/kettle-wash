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
