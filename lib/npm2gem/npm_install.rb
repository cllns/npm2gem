require "json"

module NPM2Gem
  class NPMInstall
    def initialize(package_name)
      unless system("npm install #{package_name}")
        raise NPM2Gem::Exception, "Couldn't install..."
      end

      @package_name = package_name
    end

    def path
      File.join("node_modules", @package_name)
    end

    def package_version
      parse_json_file("package.json")["version"]
    end

    private

    def parse_json_file(json_file_name)
      JSON.parse(File.read(File.join(path, json_file_name)))
    end
  end
end
