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

    def files
      @yaml_file[package_name]
    end
  end
end
