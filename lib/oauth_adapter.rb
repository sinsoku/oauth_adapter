require 'oauth_adapter/config'
require 'oauth_adapter/version'

module OAuthAdapter
  class << self
    def providers
      @providers ||= {}
    end

    def get_access_token(provider:, token:, secret: nil)
      app = OAuthAdapter.providers[provider.to_sym]
      args = [app.client_id, app.client_secret, site: app.site]

      if secret.nil?
        client = OAuth2::Client.new(*args)
        OAuth2::AccessToken.new(client, token)
      else
        consumer = OAuth::Consumer.new(*args)
        OAuth::AccessToken.new(consumer, token, secret)
      end
    end
  end
end
