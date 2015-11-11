require "bower2gem/version_updaters/base_file_updater"

module Bower2Gem
  class VersionFileUpdater < BaseFileUpdater
    def initialize
      super(
        "**/version.rb",
        /VERSION.*/,
        %{VERSION = "%s"}
      )
    end
  end
end
