require "bower2gem/config"
require "bower2gem/bower_install"
require "bower2gem/file_copier"
require "bower2gem/exception"
require "bower2gem/gem_version_updater"
require "highline/import"

module Bower2Gem
  class CLI
    attr_reader :config

    def initialize
      @config = Config.new
      @bower_install = BowerInstall.new(@config.package_name)
      @file_copier = FileCopier.new(@bower_install.path, "vendor/assets")
    end

    def run
      if new_version?
        puts "Current (gem)\t Version: #{gem_version}"
        puts "New (bower)\t Version: #{bower_version}"
        if want_to_upgrade?
          @file_copier.copy(@config.file_names)
          GemVersionUpdater.new.run(bower_version)
          puts "Done! :)"
        else
          puts "Okay, no problem!"
        end
      else
        puts "There's no new version of #{@config.package_name} "\
             "on bower. The current version is #{bower_version}"
      end

      FileUtils.rm_rf("bower_components")
    end

    private

    def want_to_upgrade?
      agree("Do you want to upgrade? [yes/no]", true)
    end

    def new_version?
      Gem::Version.new(bower_version) > Gem::Version.new(gem_version)
    end

    def gem_version
      gemspec_file_name = Dir["*.gemspec"].first
      Gem::Specification.load(gemspec_file_name).version.to_s
    end

    def bower_version
      @bower_install.package_version
    end
  end
end
