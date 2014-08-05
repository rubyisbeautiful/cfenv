# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cfenv/version'

Gem::Specification.new do |spec|
  spec.name          = 'cfenv'
  spec.version       = Cfenv::VERSION
  spec.authors       = ['Bryan Taylor']
  spec.email         = ['bryan.taylor@sabre.com']
  spec.summary       = %q{Access CF environment variables as an object}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'oj'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'byebug'

  spec.add_runtime_dependency 'multi_json'
  spec.add_runtime_dependency 'hashie'
end
