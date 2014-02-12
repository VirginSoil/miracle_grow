# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'miracle_grow/version'

Gem::Specification.new do |spec|
  spec.name          = "miracle_grow"
  spec.version       = MiracleGrow::VERSION
  spec.authors       = ["Ben Lewinsky", "The Watts", "Tyrinx", "Lucasarts"]
  spec.email         = ["bennlewis@gmail.com", "reg@nathanielwatts.com", "tyler.stephen.long@gmail.com", "lukemartinez@gmail.com"]
  spec.description   = "This is a gem to wrap the Planting Season API"
  spec.summary       = "This is a gem to wrap the Planting Season API"
  spec.homepage      = "https://github.com/VirginSoil/miracle_grow"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"

  spec.add_dependency "json"
  spec.add_dependency "faraday"
end
