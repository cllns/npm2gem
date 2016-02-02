require "spec_helper"

describe NPM2Gem::CLI do
  before(:each) do
    @cli = NPM2Gem::CLI.new
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

  it "outputs new version" do
    expect { @cli.run }.to output(/\d\.\d\.\d/).to_stdout
  end
end
