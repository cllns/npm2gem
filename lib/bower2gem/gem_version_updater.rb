require "bower2gem/version_updaters/version_file_updater"
require "bower2gem/version_updaters/gemspec_updater"

module Bower2Gem
  class GemVersionUpdater
    def initialize
      @gemspec_file_name = Dir["*.gemspec"].first
    end

    def run(version)
      if current_version =~ /VERSION/
        updater = VersionFileUpdater.new.run(version)
      else
        updater = GemspecUpdater.new.run(version)
      end
    end

    private

    def current_version
      unless gemspec_version_line.empty?
        gemspec_version_line.match(/=(.*)/).captures.first
      end
    end

    def gemspec_version_line
      File.readlines(@gemspec_file_name).select do |line|
         line =~ /\.version/
      end.first
    end
  end
end
