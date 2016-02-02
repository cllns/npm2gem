require "npm2gem/version_updaters/base_file_updater"

module NPM2Gem
  class VersionFileUpdater < BaseFileUpdater
    def initialize(file_path)
      super(
        file_path,
        old_version(file_path)
      )
    end

    private

    def old_version(file_path)
      File.read(file_path).match(/VERSION\s*=\s*"(.*)"/).captures.first
    end
  end
end
