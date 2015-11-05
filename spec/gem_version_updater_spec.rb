require "spec_helper"

describe Bower2Gem::GemVersionUpdater do
  before(:each) do
    @updater = Bower2Gem::GemVersionUpdater.new
  end

  it "updates version file" do
    @updater.run("9.9.9")
    version_file_name = @updater.instance_variable_get(:@version_file_name)
    new_version_file = File.read(version_file_name)
    expect(new_version_file).to match(/9.9.9/)
  end

  it "outputs new version" do
    @updater.run("9.9.9")
    expect { @updater.run("9.9.9") }.to output(/9.9.9/).to_stdout
  end
end
