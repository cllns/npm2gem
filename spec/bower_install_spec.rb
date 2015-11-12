require "spec_helper"

describe Bower2Gem::BowerInstall do
  subject { Bower2Gem::BowerInstall.new("bootstrap") }

  before(:each) do
    @version_hash = { "version" => "9.9.9" }
  end

  it "install bootstrap with bower" do
    # TODO: fix  this. sometimes it fails because its run first
    expect(Dir).to exist("bower_components/bootstrap")
    expect(File).to exist("bower_components/bootstrap/dist/js/bootstrap.js")
  end

  it "parse version from bower.json" do
    allow(subject).to receive( :parse_json_file).with("bower.json").
                                                  and_return( @version_hash)

    expect(subject.package_version).to eq("9.9.9")
  end

  it "parse version from .bower.json" do
    allow(subject).to receive( :parse_json_file).with("bower.json").
                                                  and_return( {} )
    allow(subject).to receive( :parse_json_file).with(".bower.json").
                                                  and_return( @version_hash)

    expect(subject.package_version).to eq("9.9.9")
  end

  it "parse version from package.json" do
    allow(subject).to receive( :parse_json_file).with("bower.json").
                                                  and_return( {} )
    allow(subject).to receive( :parse_json_file).with(".bower.json").
                                                  and_return( {} )
    allow(subject).to receive( :parse_json_file).with("package.json").
                                                  and_return( @version_hash)

    expect(subject.package_version).not_to be_nil
  end
end
