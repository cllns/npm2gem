# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "npm2gem/version"

Gem::Specification.new do |spec|
  spec.name          = "npm2gem"
  spec.version       = NPM2Gem::VERSION
  spec.authors       = ["Sean Collins"]
  spec.email         = ["sean@cllns.com"]

  spec.summary       = "A tool to help maintain Asset gems for Ruby on Rails"
  spec.homepage      = "https://github.com/cllns/npm2gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.test_files = Dir["spec/**/*"]

  spec.add_dependency "highline", "~> 1.7"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
  spec.add_development_dependency "simplecov", "~> 0.10"
end
