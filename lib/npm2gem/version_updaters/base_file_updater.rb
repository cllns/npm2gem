module NPM2Gem
  class BaseFileUpdater
    def initialize(file_name, current_version)
      @file_name = file_name
      @current_version = current_version
      @file_contents = File.read(@file_name)
    end

    def run(new_version)
      write_new_version_file(new_version)
      new_version
    end

    private

    def write_new_version_file(new_version)
      File.open(@file_name, "w") do |file|
        file.write(new_file_contents(new_version))
      end
    end

    def new_file_contents(new_version)
      @file_contents.gsub(
        @current_version,
        new_version
      )
    end
  end
end
