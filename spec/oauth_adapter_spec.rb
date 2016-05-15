require 'spec_helper'

describe OAuthAdapter do
  describe '.get_access_token' do
    before(:all) do
      OAuthAdapter.configure do
        provider :twitter, 'TWITTER_KEY', 'TWITTER_SECRET', 'https://api.twitter.com'
        provider :github, 'GITHUB_KEY', 'GITHUB_SECRET', 'https://api.github.com'
      end
    end
    after(:all) { OAuthAdapter.providers.clear }

    context 'OAuth' do
      subject { OAuthAdapter.get_access_token(provider: :twitter, token: 'token', secret: 'secret') }

      it 'returns the OAuth::AccessToken object' do
        is_expected.to be_a OAuth::AccessToken

        expect(subject.consumer.key).to eq 'TWITTER_KEY'
        expect(subject.consumer.secret).to eq 'TWITTER_SECRET'
        expect(subject.consumer.options[:site]).to eq 'https://api.twitter.com'
        expect(subject.token).to eq 'token'
        expect(subject.secret).to eq 'secret'
      end
    end

    context 'OAuth2' do
      subject { OAuthAdapter.get_access_token(provider: :github, token: 'token') }

      it 'returns the OAuth2::AccessToken object' do
        is_expected.to be_a OAuth2::AccessToken

        expect(subject.client.id).to eq 'GITHUB_KEY'
        expect(subject.client.secret).to eq 'GITHUB_SECRET'
        expect(subject.client.site).to eq 'https://api.github.com'
        expect(subject.token).to eq 'token'
      end
    end
  end
end
