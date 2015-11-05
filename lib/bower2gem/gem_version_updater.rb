module Bower2Gem
  class GemVersionUpdater
    def initialize
      @version_file_name = Dir["**/version.rb"].first
    end

    def run(new_version)
      write_new_version_file(new_version)
      puts "Updated version in gem to #{new_version}"
    end

    private

    def file_contents
      File.read(@version_file_name)
    end

    def new_file_contents(new_version)
      file_contents.gsub(
        /VERSION.*/,
        %{VERSION = "#{new_version}"}
      )
    end

    def write_new_version_file(new_version)
      new_contents = new_file_contents(new_version)
      File.open(@version_file_name, "w") { |file| file.puts(new_contents) }
    end
  end
end
