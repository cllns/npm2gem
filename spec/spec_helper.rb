$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
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
end
