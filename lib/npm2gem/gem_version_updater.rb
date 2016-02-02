require "npm2gem/version_updaters/version_file_updater"
require "npm2gem/version_updaters/gemspec_updater"

module NPM2Gem
  class GemVersionUpdater
    def initialize
      @gemspec_file_name = Dir["*.gemspec"].first
    end

    def run(new_version)
      if gemspec_version =~ /VERSION/
        VersionFileUpdater.new(file_path).run(new_version)
      else
        GemspecUpdater.new(file_path, gemspec_version).run(new_version)
      end
    end

    private

    def file_path
      if gemspec_version =~ /VERSION/
        Dir["**/version.rb"].first
      else
        @gemspec_file_name
      end
    end

    def gemspec_version
      unless gemspec_version_line.empty?
        gemspec_version_line.match(
          /=\s*(.*VERSION.*)\s*|["'](.*)["']/
        ).captures.compact.first
      end
    end

    def gemspec_version_line
      File.readlines(@gemspec_file_name).detect do |line|
        line =~ /\.version/
      end
    end
  end
end
