require "spec_helper"
require "bower2gem/cli"

describe Bower2Gem::CLI do
  it "downloads javascript file" do
    Bower2Gem::CLI.new
    expect(File).to exist("vendor/assets/javascripts/bootstrap.js")
  end

  it "downloads sylesheet files" do
    Bower2Gem::CLI.new
    expect(File).to exist("vendor/assets/stylesheets/bootstrap.css")
    expect(File).to exist("vendor/assets/stylesheets/bootstrap-theme.css")
  end
end
