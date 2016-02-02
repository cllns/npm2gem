require "simplecov"
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "simplecov"
SimpleCov.start do
  add_filter "/spec"
end

require "npm2gem"

base_directory = Dir.pwd
dummy_directory = File.join(base_directory, "spec", "dummy")

RSpec.configure do |config|
  config.before(:all) do
    Dir.chdir(dummy_directory)
  end

  config.after(:all) do
    # We clean up in the codebase, but if there's errors it doesn't get that far
    #FileUtils.rm_rf(File.join(dummy_directory, "node_modules"))
    # Restore the dummy app, since we change the files in it
    `git checkout -- #{dummy_directory}`
  end
end
