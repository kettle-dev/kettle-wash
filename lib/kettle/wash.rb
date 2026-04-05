# frozen_string_literal: true

require "version_gem"
require_relative "wash/version"
Kettle::Wash::Version.class_eval do
  extend VersionGem::Basic
end

module Kettle
  module Wash
    class Error < StandardError; end
    # Your code goes here...
  end
end
