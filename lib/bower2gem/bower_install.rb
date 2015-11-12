require "json"

module Bower2Gem
  class BowerInstall
    def initialize(package_name)
      unless system("bower install #{package_name}")
        raise Bower2Gem::Exception, "Couldn't install..."
      end

      @package_name = package_name
    end

    def path
      File.join("bower_components", @package_name)
    end

    def package_version
      parse_json_file("bower.json")["version"] ||
      parse_json_file(".bower.json")["version"] ||
      parse_json_file("package.json")["version"]
    end

    private

    def parse_json_file(json_file_name)
      JSON.parse(File.read(File.join(path, json_file_name)))
    end
  end
end
