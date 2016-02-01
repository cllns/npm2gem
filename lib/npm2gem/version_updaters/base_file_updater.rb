module NPM2Gem
  class BaseFileUpdater
    def initialize(file_name_glob, search_pattern, replace_template)
      @file_name = Dir[file_name_glob].first
      @search_pattern = search_pattern
      @replace_template = replace_template
    end

    def run(new_version)
      write_new_version_file(new_version)
      puts "Updated version in gem to #{new_version}"
    end

    private

    def file_contents
      File.read(@file_name)
    end

    def new_file_contents(new_version)
      file_contents.gsub(
        @search_pattern,
        @replace_template % new_version
      )
    end

    def write_new_version_file(new_version)
      new_contents = new_file_contents(new_version)
      File.open(@file_name, "w") { |file| file.puts(new_contents) }
    end
  end
end
