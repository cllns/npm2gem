require "spec_helper"
require "bower2gem/bower_install"

describe Bower2Gem::BowerInstall do
  it "install package with bower" do
    Bower2Gem::BowerInstall.new("rome")
    expect(Dir).to exist("bower_components/rome")
    expect(File).to exist("bower_components/rome/dist/rome.js")
  end
end
