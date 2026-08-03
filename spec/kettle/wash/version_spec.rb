# frozen_string_literal: true

require "anonymous_loader"
require "kettle/wash"
RSpec.describe Kettle::Wash::Version do
  it_behaves_like "a Version module", described_class

  it "executes the version file for coverage without redefining constants" do
    paths = [
      File.expand_path("../../../lib/kettle/wash/version.rb", __dir__),
      File.expand_path("../../../lib/kettle/wash/version_gem.rb", __dir__)
    ].select { |path| File.file?(path) }
    anonymous_namespace = AnonymousLoader.load(files: paths)

    expect(anonymous_namespace::Kettle::Wash::Version::VERSION).to eq(described_class::VERSION)
  end
end
