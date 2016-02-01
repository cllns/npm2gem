require "npm2gem/version_updaters/base_file_updater"

module NPM2Gem
  class GemspecUpdater < BaseFileUpdater
    def initialize
      super(
        "*.gemspec",
        /(\s*.*.version\s*=\s*).*/,
        %{#{1}%s}
      )
    end
  end
end
