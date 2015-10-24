module Bower2Gem
  class BowerInstall
    def initialize(package_name)
      unless system("bower install")
        raise Bower2Gem::Exception, "Couldn't install..."
      end

      @package_name = package_name
    end

    def package_path
      File.join("bower_components", @package_name)
    end
  end
end
