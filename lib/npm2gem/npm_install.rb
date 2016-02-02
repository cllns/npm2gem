require "json"

module NPM2Gem
  class NPMInstall
    def initialize(package_name)
      create_node_modules_directory

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

    # If npm cannot create a `node_modules` folder,
    # it will fallback to installing globally.
    # We don't want that.
    def create_node_modules_directory
      Dir.mkdir("node_modules") unless Dir.exist?("node_modules")
    end

    def parse_json_file(json_file_name)
      JSON.parse(File.read(File.join(path, json_file_name)))
    end
  end
end
