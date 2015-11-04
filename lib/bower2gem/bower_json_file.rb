require "bower2gem/bower_install"

require "json"

module Bower2Gem
  class BowerJsonFile
    def initialize(package_name)
      @bower_install = BowerInstall.new(package_name)
    end

    def parse_bower_json
      JSON.parse(bower_json_file)
    end

    def main_file_names
      file_names = parse_bower_json["main"]

      if file_names.is_a?(String)
        return [ file_names ]
      end

      file_names
    end

    private

    def bower_json_file
      File.read(bower_json_path)
    end

    def bower_json_path
      File.join(Dir.pwd, @bower_install.package_path, "bower.json")
    end

  end
end
