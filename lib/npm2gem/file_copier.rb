require "fileutils"

module NPM2Gem
  class FileCopier
    def initialize(from_base, to_base)
      @from_base = from_base
      @to_base = to_base
    end

    def copy(input_paths)
      input_paths.each do |input_path|
        # TODO: replace with polymorphism, for the love of god
        if input_path.is_a?(Hash)
          copy_to_subfolder(input_path)
        else
          copy_single(input_path)
        end
      end
    end

    private

    def copy_to_subfolder(input_hash)
      input_hash.each do |subfolder, input_paths|
        input_paths.each do |input_path|
          copy_single(input_path, subfolder)
        end
      end
    end

    def copy_single(input_path, subfolder = "")
      Dir.glob(from_path(input_path)).each do |from_path|
        file_type_directory = file_type_directory(from_path)
        FileUtils.mkdir_p(to_path(file_type_directory, subfolder))

        FileUtils.cp(
          from_path,
          to_path(file_type_directory, subfolder)
        )
        puts "Copied #{from_path} \t"
        puts " to #{to_path(input_path, subfolder)}"
      end
    end

    def from_path(input_path)
      File.join(@from_base, input_path)
    end

    def to_path(file_type_directory, subfolder = "",file_name = "")
      File.join(@to_base, file_type_directory, subfolder, file_name)
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
