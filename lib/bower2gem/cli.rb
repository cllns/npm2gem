require "bower2gem/bower_json_file"
require "bower2gem/exception"

module Bower2Gem
  class CLI
    def initialize
      @bower_json_file = BowerJsonFile.new(package_name)
      puts @bower_json_file.main_file_names
    end

    private

    def package_name
      # TODO: support more than one dependency?
      JSON.parse(File.read("bower.json"))["dependencies"].keys.first
    end

  end
end
