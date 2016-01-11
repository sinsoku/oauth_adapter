module OAuthAdapter
  class << self
    def configure(&block)
      config.instance_eval(&block)
    end

    def config
      @config ||= Configuration.new
    end
  end

  Application = Struct.new(:client_id, :client_secret, :site)

  class Configuration
    def provider(name, client_id, client_secret, site)
      app = Application.new(client_id, client_secret, site)
      OAuthAdapter.providers[name] = app
    end
  end
end
