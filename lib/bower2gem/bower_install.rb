require "json"

module Bower2Gem
  class BowerInstall
    def initialize(package_name)
      unless system("bower install #{package_name}")
        raise Bower2Gem::Exception, "Couldn't install..."
      end

      @package_name = package_name
    end

    def package_path
      File.join("bower_components", @package_name)
    end

    def package_version
      parsed_package_json_file["version"]
    end

    private

    def parsed_package_json_file
      JSON.parse(File.read(package_json_path))
    end

    def package_json_path
      File.join(package_path, "package.json")
    end
  end
end
