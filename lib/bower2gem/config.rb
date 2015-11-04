require "yaml"

module Bower2Gem
  class Config
    def initialize
      @yaml_file = YAML.load_file(".bower2gem.yml")
    end

    # TODO: support more than one?
    def package_name
      @yaml_file.keys.first
    end

    def file_names
      @yaml_file[package_name]
    end
  end
end
