require "fileutils"

module NPM2Gem
  class FileCopier
    def initialize(from_base, to_base)
      @from_base = from_base
      @to_base = to_base
    end

    def copy(input_paths)
      input_paths.each do |input_path|
        copy_single(input_path)
        puts "Copied #{from_path(input_path)} \t to #{to_path(input_path)}"
      end
    end

    private

    def copy_single(input_path)
      file_name = file_name(input_path)
      file_type_directory = file_type_directory(file_name)

      FileUtils.mkdir_p(to_path(file_type_directory))

      Dir.glob(from_path(input_path)).each do |from_path|
        FileUtils.cp(
          from_path,
          to_path(file_type_directory, file_name)
        )
      end
    end

    def from_path(input_path)
      File.join(@from_base, input_path)
    end

    def to_path(file_type_directory, file_name = "")
      File.join(@to_base, file_type_directory, file_name)
    end

    def file_type_directory(file_name)
      if file_name.include?("css")
        "stylesheets"
      elsif file_name.include?("js")
        "javascripts"
      end
    end

    def file_name(input_path)
      input_path.split("/").last
    end
  end
end
