module OAuthAdapter
  module ProviderSaving
    def provider(klass, *args, &block)
      super

      if klass.is_a?(Class)
        name = klass.name.split('::').last.downcase
        strategy_class = klass
      else
        name = klass
        class_name = OmniAuth::Utils.camelize(klass)
        strategy_class = OmniAuth::Strategies.const_get(class_name)
      end
      client_options = strategy_class.default_options.client_options
      site = client_options.site if client_options

      OAuthAdapter.config.provider(name, args[0], args[1], site) if site
    end
  end
  OmniAuth::Builder.prepend(ProviderSaving)
end
