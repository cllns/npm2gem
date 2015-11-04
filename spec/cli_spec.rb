require "spec_helper"
require "bower2gem/cli"

describe Bower2Gem::CLI do
  it "downloads javascript file" do
    Bower2Gem::CLI.new
    expect(File).to exist("vendor/assets/rome.js")
  end
end
