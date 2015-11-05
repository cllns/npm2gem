require "bower2gem/config"
require "bower2gem/bower_install"
require "bower2gem/file_copier"
require "bower2gem/exception"

module Bower2Gem
  class CLI
    attr_reader :config

    def initialize
      @config = Config.new
      @bower_install = BowerInstall.new(@config.package_name)
      @file_copier = FileCopier.new(@bower_install.package_path, "vendor/assets")

      @file_copier.copy(@config.file_names)

      puts "Current Version: #{current_version}"
      puts "New     Version: #{new_version}"

      FileUtils.rm_rf("bower_components")
    end


    def current_version
      gemspec_file_name = Dir["*.gemspec"].first
      Gem::Specification::load(gemspec_file_name).version.to_s
    end

    def new_version
      @bower_install.package_version
    end
  end
end
