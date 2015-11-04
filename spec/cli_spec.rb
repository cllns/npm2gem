require "spec_helper"
require "bower2gem/cli"

describe Bower2Gem::CLI do
  it "does something useful" do
    expect { Bower2Gem::CLI.new }.to output("dist/rome.js\n").to_stdout
  end
end
