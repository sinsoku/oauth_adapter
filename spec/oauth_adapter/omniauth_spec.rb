require 'spec_helper'

describe OAuthAdapter::ProviderSaving do
  describe '#provider' do
    let(:builder) { OmniAuth::Builder.new nil }

    context 'general strategy' do
      before do
        builder.provider :twitter, 'TWITTER_KEY', 'TWITTER_SECRET', 'https://api.twitter.com'
      end
      after { OAuthAdapter.providers.clear }

      it { expect(OAuthAdapter.providers).to have_key :twitter }
    end

    context 'developer strategy' do
      before { builder.provider :developer }
      after { OAuthAdapter.providers.clear }

      it { expect(OAuthAdapter.providers).to be_empty }
    end
  end
end
