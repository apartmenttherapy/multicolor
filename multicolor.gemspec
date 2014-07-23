# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'multicolor/version'

Gem::Specification.new do |spec|
  spec.name          = "multicolor"
  spec.version       = Multicolor::VERSION
  spec.authors       = ["ramin keene"]
  spec.email         = ["raminkeene@gmail.com"]
  spec.description   = %q{ ruby api client for TinEye Multicolor API}
  spec.summary       = %q{ ruby api client for easy interaction with TinEye Multicolor API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.8.9"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "activesupport"
  spec.add_dependency "i18n"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
