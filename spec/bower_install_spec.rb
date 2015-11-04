require "spec_helper"
require "bower2gem/bower_install"

describe Bower2Gem::BowerInstall do
  it "install package with bower" do
    Bower2Gem::BowerInstall.new("bootstrap")
    expect(Dir).to exist("bower_components/bootstrap")
    expect(File).to exist("bower_components/bootstrap/dist/js/bootstrap.js")
  end
end
