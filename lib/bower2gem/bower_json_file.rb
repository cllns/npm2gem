require "json"

module Bower2Gem
  class BowerJsonFile
    def initialize(bower_install)
      @bower_install = bower_install
    end

    def self.parse(bower_install)
      self.new(bower_install).parse_bower_json
    end

    def parse_bower_json
      JSON.parse(bower_json_file)
    end

    private

    def bower_json_file
      puts bower_json_path
      File.read(bower_json_path)
    end

    def bower_json_path
      File.join(Dir.pwd, @bower_install.package_path, "bower.json")
    end

  end
end
