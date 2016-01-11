# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oauth_adapter/version'

Gem::Specification.new do |spec|
  spec.name          = 'oauth_adapter'
  spec.version       = OauthAdapter::VERSION
  spec.authors       = ["sinsoku"]
  spec.email         = ["sinsoku.listy@gmail.com"]

  spec.summary       = 'OAuth Adapter provides a simple way that use OAuth request'
  spec.description   = 'OAuth Adapter provides a simple way that use OAuth request'
  spec.homepage      = 'https://github.com/sinsoku/oauth_adapter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'oauth', '>= 0.4.7'
  spec.add_dependency 'oauth2', '>= 1.0.0'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
