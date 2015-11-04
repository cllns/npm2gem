require "bower2gem/bower_json_file"
require "bower2gem/file_copier"
require "bower2gem/config"
require "bower2gem/exception"

module Bower2Gem
  class CLI
    attr_reader :config

    def initialize
      @config = Config.new
      @bower_json_file = BowerJsonFile.new(@config.package_name)
      @file_copier = FileCopier.new(@bower_json_file.package_path, "vendor/assets")

      @file_copier.copy(@config.file_names)

      FileUtils.rm_rf("bower_components")
    end
  end
end
