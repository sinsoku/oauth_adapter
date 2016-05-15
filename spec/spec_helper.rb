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
