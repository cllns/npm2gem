require "npm2gem/version_updaters/base_file_updater"

module NPM2Gem
  class GemspecUpdater < BaseFileUpdater
    def initialize(file_path, current_version)
      super(
        file_path,
        current_version
      )
    end
  end
end
