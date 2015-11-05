require "fileutils"

module Bower2Gem
  class FileCopier
    def initialize(from_base, to_base)
      @from_base = from_base
      @to_base = to_base
      create_to_directory_if_needed
    end

    def copy(from_paths)
      from_paths.each do |from_path|
        FileUtils.cp(
          File.join(@from_base, from_path),
          to_path(from_path)
        )
        puts "Copyied #{from_path} \t to #{to_path(from_path)}"
      end
    end

    private

    def to_path(file_name)
      file_name = file_name.split("/").last
      if file_name.match("css")
        file_type_directory = "stylesheets"
      elsif file_name.match("js")
        file_type_directory = "javascripts"
      end
      File.join(@to_base, file_type_directory, file_name)
    end

    def create_to_directory_if_needed
      unless Dir.exists?(@to_base)
        FileUtils.mkdir_p(@to_base)
      end
    end
  end
end
