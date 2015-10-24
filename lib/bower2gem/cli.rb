require "bower2gem/bower_json_file"
require "bower2gem/bower_install"
require "bower2gem/exception"

module Bower2Gem
  class CLI
    def initialize(package_name)
      @bower_install = BowerInstall.new(package_name)
      @bower_json_file = BowerJsonFile.parse(@bower_install)
      main_file_names.each do |file_name|
        puts file_name
      end
    end

    private

    def main_file_names
      file_names = @bower_json_file["main"]

      if file_names.is_a?(String)
        return [ file_names ]
      end

      file_names
    end
  end
end
