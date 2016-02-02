require "npm2gem/config"
require "npm2gem/npm_install"
require "npm2gem/file_copier"
require "npm2gem/exception"
require "npm2gem/gem_version_updater"
require "highline/import"

module NPM2Gem
  class CLI
    attr_reader :config

    def initialize
      @config = Config.new
      @npm_install = NPMInstall.new(@config.package_name)
      @file_copier = FileCopier.new(@npm_install.path, "vendor/assets")
    end

    def run
      if new_version?
        puts "Current (gem)\t Version: #{gem_version}"
        puts "New (npm)\t Version: #{npm_version}"
        if want_to_upgrade?
          @file_copier.copy(@config.files_to_copy)
          version = GemVersionUpdater.new.run(npm_version)
          puts "Done! :) Upgraded to #{version}"
        else
          puts "Okay, no problem!"
        end
      else
        puts "There's no new version of #{@config.package_name} "\
             "on npm. The current version is #{npm_version}"
      end

      #      FileUtils.rm_rf("node_modules")
    end

    private

    def want_to_upgrade?
      agree("Do you want to upgrade? [y/n]", true)
    end

    def new_version?
      Gem::Version.new(npm_version) > Gem::Version.new(gem_version)
    end

    def gem_version
      gemspec_file_name = Dir["*.gemspec"].first
      Gem::Specification.load(gemspec_file_name).version.to_s
    end

    def npm_version
      @npm_install.package_version
    end
  end
end
