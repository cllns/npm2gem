require "spec_helper"

describe NPM2Gem::FileCopier do
  before(:all) do
    FileUtils.mkdir_p("tmp-source/js/locale")
    FileUtils.touch("tmp-source/js/locale/en.js")
    FileUtils.touch("tmp-source/js/locale/es.js")

    FileUtils.mkdir_p("tmp-dest/vendor/assets")
  end

  subject do
    NPM2Gem::FileCopier.new("tmp-source", "tmp-dest/vendor/assets")
  end

  it "copies files, specifically listed" do
    subject.copy([ "js/locale/en.js", "js/locale/es.js"])
    expect(File).to exist("tmp-dest/vendor/assets/javascripts/en.js")
    expect(File).to exist("tmp-dest/vendor/assets/javascripts/es.js")
  end

  it "copies files, which are globbed" do
    subject.copy([ "js/locale/*.js"])
    expect(File).to exist("tmp-dest/vendor/assets/javascripts/en.js")
    expect(File).to exist("tmp-dest/vendor/assets/javascripts/es.js")
  end
end
