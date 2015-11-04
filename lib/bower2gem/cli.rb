require "bower2gem/bower_json_file"
require "bower2gem/file_copier"
require "bower2gem/exception"

module Bower2Gem
  class CLI
    def initialize
      @bower_json_file = BowerJsonFile.new(package_name)
      @file_copier = FileCopier.new(@bower_json_file.package_path, "vendor/assets")
      @file_copier.copy(@bower_json_file.main_file_names)
    end

    private

    def package_name
      # TODO: support more than one dependency?
      JSON.parse(File.read("bower.json"))["dependencies"].keys.first
    end

  end
end
