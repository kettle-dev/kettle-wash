# frozen_string_literal: true

RSpec.describe Kettle::Wash do
  it "has a version number" do
    expect(Kettle::Wash::VERSION).not_to be nil
  end

  it "defines a domain error type" do
    expect(Kettle::Wash::Error).to be < StandardError
  end
end
