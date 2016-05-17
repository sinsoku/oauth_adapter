require 'simplecov'
SimpleCov.start 'test_frameworks'

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'oauth'
require 'oauth2'
require 'oauth_adapter'

# omniauth
require 'omniauth'
require 'oauth_adapter/omniauth'

module OmniAuth
  module Strategies
    class Twitter
      include OmniAuth::Strategy

      option :client_options, {
        site: 'https://api.twitter.com',
      }
    end
  end
end
