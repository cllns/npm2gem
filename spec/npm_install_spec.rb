require "spec_helper"

describe NPM2Gem::NPMInstall do
  subject { NPM2Gem::NPMInstall.new("bootstrap") }

  before(:each) do
    @version_hash = { "version" => "9.9.9" }
  end

  it "install bootstrap with npm" do
    # TODO: fix  this. sometimes it fails because its run first
    expect(Dir).to exist("node_modules/bootstrap")
    expect(File).to exist("node_modules/bootstrap/dist/js/bootstrap.js")
  end

  it "parse version from package.json" do
    allow(subject).to receive( :parse_json_file).with("package.json").
                                                  and_return( @version_hash)

    expect(subject.package_version).not_to be_nil
  end
end
