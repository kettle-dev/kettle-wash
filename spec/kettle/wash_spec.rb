# frozen_string_literal: true

require "fileutils"

RSpec.describe Kettle::Wash do
  after do
    Array(@tmp_dirs).each { |path| FileUtils.remove_entry(path) if File.exist?(path) }
  end

  it "has a version number" do
    expect(Kettle::Wash::VERSION).not_to be_nil
  end

  it "defines a domain error type" do
    expect(Kettle::Wash::Error).to be < StandardError
  end

  describe "::delete_constants" do
    it "removes configured constants from an owner module" do
      owner = Module.new
      owner.const_set(:EXAMPLE, "value")
      owner.const_set(:KEEP, "value")

      described_class.delete_constants(owner, %w[EXAMPLE MISSING])

      expect(owner.const_defined?(:EXAMPLE, false)).to be(false)
      expect(owner.const_defined?(:KEEP, false)).to be(true)
    end

    it "accepts a single constant name" do
      owner = Module.new
      owner.const_set(:EXAMPLE, "value")

      described_class.delete_constants(owner, :EXAMPLE)

      expect(owner.const_defined?(:EXAMPLE, false)).to be(false)
    end
  end

  describe "::reset_constants" do
    it "deletes configured constants and reloads the given path" do
      owner = Module.new
      owner.const_set(:EXAMPLE, "old")
      stub_const("Kettle::WashResetSpecModule", owner)
      path = write_tmp_file("Kettle::WashResetSpecModule.const_set(:EXAMPLE, \"new\")\n")

      described_class.reset_constants(owner: owner, constants: %w[EXAMPLE], path: path)

      expect(owner.const_get(:EXAMPLE)).to eq("new")
    end
  end

  describe Kettle::Wash::Change do
    it "builds an inert module when no constants or path are provided" do
      base = Module.new

      base.include(described_class.new)

      expect(base).not_to respond_to(:reset_const)
      expect(base).not_to respond_to(:delete_const)
    end

    it "adds constant reset helpers when constants and path are provided" do
      base = Module.new

      base.include(described_class.new(constants: "EXAMPLE", path: "kettle/wash.rb"))

      expect(base).to respond_to(:reset_const)
      expect(base).to respond_to(:delete_const)
    end

    it "deletes configured constants and yields after deletion" do
      base = Module.new
      base.const_set(:EXAMPLE, "value")
      base.include(described_class.new(constants: "EXAMPLE", path: "kettle/wash.rb"))
      yielded_with_constant_deleted = nil

      base.delete_const do
        yielded_with_constant_deleted = !base.const_defined?(:EXAMPLE, false)
      end

      expect(yielded_with_constant_deleted).to be(true)
      expect(base.const_defined?(:EXAMPLE, false)).to be(false)
    end

    it "ignores missing configured constants" do
      base = Module.new
      base.include(described_class.new(constants: "EXAMPLE", path: "kettle/wash.rb"))

      expect { base.delete_const }.not_to raise_error
    end

    it "resets configured constants and yields before reloading" do
      base = Module.new
      base.const_set(:EXAMPLE, "old")
      stub_const("Kettle::WashChangeSpecModule", base)
      path = write_tmp_file("Kettle::WashChangeSpecModule.const_set(:EXAMPLE, \"reset\")\n")
      base.include(described_class.new(constants: "EXAMPLE", path: path))
      value_during_yield = nil

      base.reset_const do
        value_during_yield = base.const_defined?(:EXAMPLE, false)
      end

      expect(value_during_yield).to be(false)
      expect(base.const_get(:EXAMPLE)).to eq("reset")
    end
  end

  def write_tmp_file(content)
    tmp_parent = File.expand_path("../../tmp", __dir__)
    FileUtils.mkdir_p(tmp_parent)
    tmp_dir = Dir.mktmpdir(nil, tmp_parent)
    (@tmp_dirs ||= []) << tmp_dir
    path = File.join(tmp_dir, "constants.rb")
    File.write(path, content)
    path
  end
end
