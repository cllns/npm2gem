require "spec_helper"

describe Bower2Gem::CLI do
  before(:each) do
    @cli = Bower2Gem::CLI.new
    allow(@cli).to receive(:want_to_upgrade?) { true }
    @cli.run
  end

  it "downloads javascript file" do
    expect(File).to exist("vendor/assets/javascripts/bootstrap.js")
  end

  it "downloads stylesheet files" do
    expect(File).to exist("vendor/assets/stylesheets/bootstrap.css")
    expect(File).to exist("vendor/assets/stylesheets/bootstrap-theme.css")
  end
end
