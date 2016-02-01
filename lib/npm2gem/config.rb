require "yaml"

module NPM2Gem
  class Config
    def initialize
      @yaml_file = YAML.load_file(".npm2gem.yml")
    end

    # TODO: support more than one?
    def package_name
      @yaml_file.keys.first
    end

    # This is an array, of either:
    #   - file names, or
    #   - a hash: { destination_subfolder: files }
    def files_to_copy
      @yaml_file[package_name]
    end
  end
end
