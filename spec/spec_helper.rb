require "simplecov"
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "simplecov"
SimpleCov.start do
  add_filter "/spec"
end

require "bower2gem"

base_directory = Dir.pwd
dummy_directory = File.join(base_directory, "spec", "dummy")

RSpec.configure do |config|
  config.before(:all) do
    Dir.chdir(dummy_directory)

    # Eventually these should be removed, since we'll do it on the fly, in code
    FileUtils.mkdir_p("bower_components")
    FileUtils.mkdir_p("vendor/assets/javascripts")
    FileUtils.mkdir_p("vendor/assets/stylesheets")
  end

  config.after(:all) do
    # We clean up in the codebase, but if there's errors it doesn't get that far
    FileUtils.rm_rf(File.join(dummy_directory, "bower_components"))
    # Restore the dummy app, since we change the files in it
    `git checkout -- #{dummy_directory}`
  end
end
