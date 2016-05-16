# OAuthAdapter

[![Build Status](https://travis-ci.org/sinsoku/oauth_adapter.svg?branch=master)](https://travis-ci.org/sinsoku/oauth_adapter)
[![codecov](https://codecov.io/gh/sinsoku/oauth_adapter/branch/master/graph/badge.svg)](https://codecov.io/gh/sinsoku/oauth_adapter)

It provides a simple method to use the OAuth libraries.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'oauth_adapter'
```

And then execute:

    $ bundle

## Configuration


```ruby
OAuthAdapter.configure do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'], 'https://api.twitter.com'
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], 'https://api.github.com'
end
```

### OmniAuth Support

If you use with [intridea/omniauth](https://github.com/intridea/omniauth), you may omit the configuration by requiring 'oauth_adapter/omniauth'. This is an example at `config/initializers/omniauth.rb`:


```ruby
require 'oauth_adapter/omniauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end
```

## Usage

You will get either appropriate object of OAuth or OAuth2.

```ruby
OAuthAdapter.get_access_token(provider: :github, token: '<access_token>')
#=> #<OAuth2::AccessToken:0x007f9d763e5b50...
OAuthAdapter.get_access_token(provider: :twitter, token: '<access_token>', secret: '<token_secret>')
#=> #<OAuth::AccessToken:0x007f9d763d5430...
```

If you want to know how to use the `AccessToken` object, you should read to the documentation for each libraries.

- [oauth-xx/oauth](https://github.com/oauth-xx/oauth-ruby)
- [intridea/oauth2](https://github.com/intridea/oauth2).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sinsoku/oauth_adapter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

