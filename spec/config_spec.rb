require "spec_helper"

describe NPM2Gem::Config do
  before(:all) do
    FileUtils.mkdir("tmp")
    Dir.chdir("tmp")
    File.open(".npm2gem.yml", "w") do |file|
      file.puts("bootstrap:")
      file.puts("  - dist/css/bootstrap.css")
      file.puts("  - dist/js/bootstrap.js")
      file.puts("  - theme:")
      file.puts("    - dist/css/bootstrap-theme.css")
    end
  end

  after(:all) do
    Dir.chdir("..")
    FileUtils.rm_rf("tmp")
  end

  subject do
    NPM2Gem::Config.new
  end

  it "returns package name" do
    expect(subject.package_name).to eq("bootstrap")
  end

  it "returns contents of package to copy, including a hash" do
    expect(subject.files_to_copy).to eq([
      "dist/css/bootstrap.css",
      "dist/js/bootstrap.js",
      {
        "theme" => ["dist/css/bootstrap-theme.css"]
      }
    ])
  end
end
