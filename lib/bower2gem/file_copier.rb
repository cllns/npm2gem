require "fileutils"

module Bower2Gem
  class FileCopier
    def initialize(from, to)
      @from = from
      @to = to
      create_to_directory_if_needed
    end

    def copy(file_names)
      file_paths(file_names).each do |file_path|
        FileUtils.cp(file_path, @to)
      end
    end

    private

    def file_paths(file_names)
      file_names.map do |file_name|
        File.join(@from, file_name)
      end
    end

    def create_to_directory_if_needed
      unless Dir.exists?(@to)
        FileUtils.mkdir_p(@to)
      end
    end
  end
end
