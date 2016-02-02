require "spec_helper"

describe NPM2Gem::GemVersionUpdater do

  after(:each) do
    `git co -- .`
  end

  it "updates .gemspec file" do
    File.write(
      "dummy.gemspec",
      %{
         Gem::Specification.new do |spec|
           spec.name          = "dummy"
           spec.version       = "0.1.0"
         end
      }
    )
    @updater = NPM2Gem::GemVersionUpdater.new
    @updater.run("9.9.9")
    gemspec_file_name = @updater.instance_variable_get(:@gemspec_file_name)
    p "gemspec_file_name"
    p gemspec_file_name
    new_gemspec_file = File.read(gemspec_file_name)
    expect(new_gemspec_file).to eq(
      %{
         Gem::Specification.new do |spec|
           spec.name          = "dummy"
           spec.version       = "9.9.9"
         end
      }
    )
  end

  it "updates version.rb file" do
    @updater = NPM2Gem::GemVersionUpdater.new
    @updater.run("9.9.9")
    new_version_file = File.read(Dir["**/version.rb"].first)
    expect(new_version_file).to eq(
      %{module Dummy
  VERSION = "9.9.9"
end
}
    )
  end
end
