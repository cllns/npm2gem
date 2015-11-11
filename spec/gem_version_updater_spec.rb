require "spec_helper"

describe Bower2Gem::GemVersionUpdater do
  before(:each) do
    @updater = Bower2Gem::GemVersionUpdater.new
  end

  it "updates .gemspec file" do
    File.write(
      "dummy.gemspec",
      %{
         Gem::Specification.new do |spec|
           spec.name          = "dummy"
           spec.version       = 0.1.0
         end
      }
    )
    @updater.run("9.9.9")
    gemspec_file_name = @updater.instance_variable_get(:@gemspec_file_name)
    new_gemspec_file = File.read(gemspec_file_name)
    expect(new_gemspec_file).to match(/9.9.9/)

    `git co -- .`
  end

  it "updates version.rb file" do
    @updater.run("9.9.9")
    new_version_file = File.read(Dir["**/version.rb"].first)
    expect(new_version_file).to match(/9.9.9/)
  end

  it "outputs new version" do
    @updater.run("9.9.9")
    expect { @updater.run("9.9.9") }.to output(/9.9.9/).to_stdout
  end
end
