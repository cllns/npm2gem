# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dummy/version"

Gem::Specification.new do |spec|
  spec.name          = "dummy"
  spec.version       = Dummy::VERSION
  spec.authors       = ["Sean Collins"]
  spec.email         = ["sean@cllns.com"]

  spec.summary       = " A Dummy Gem for testing the 'bower2gem' gem"
  spec.license       = "MIT"

  # Since this is a gem just for testing, we don't want to push it to
  # rubygems.org
  spec.metadata["allowed_push_host"] = nil

  spec.files         = `git ls-files`.split("\n").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", "~> 4.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3.0"
end
