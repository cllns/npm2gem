$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "bower2gem"

spec_tmp_dir = "spec/tmp"
base_directory = Dir.pwd

RSpec.configure do |config|
  config.before(:all) do
    Dir.chdir("spec")
    FileUtils.rm_rf("tmp") # Just in case it didn't get cleaned up
    Dir.mkdir("tmp")
    Dir.chdir("tmp")
    Dir.mkdir("bower_components")
    FileUtils.cp("../../bower.json", ".")
  end

  config.after(:all) do
    Dir.chdir(base_directory)
    FileUtils.rm_rf(spec_tmp_dir)
  end
end
