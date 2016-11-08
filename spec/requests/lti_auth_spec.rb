require 'rails_helper'
require 'lti_sample_data'

RSpec.describe "LTI auth", :type => :request do
  context 'with a valid group' do
    before do
      @key = SecureRandom.hex(16)
      @secret = SecureRandom.hex(16)
      @nonce = SecureRandom.hex(16)
      @timestamp = Time.now.to_i
      @test_group = Group.create name: 'LTI Test',
        oauth_consumer_key: @key,
        oauth_consumer_secret: @secret
    end

    context 'with a valid request' do
      before do
        # if we're signing the request with transversions.net, the controller
        # also needs to think it is at transversions.net.
        host! 'transversions.net'

        @params = SAMPLE_LTI_REQUEST.dup

        # set request-specific params
        @params['oauth_consumer_key'] = @key
        @params['oauth_nonce'] = @nonce
        @params['oauth_timestamp'] = @timestamp

        @site = 'http://transversions.net'
        @path = '/auth/lti'
        @uri = "#{@site}#{@path}"

        @request = OAuth::RequestProxy.proxy 'method' => 'POST',
            'uri' => @uri,
            'parameters' => @params
        @request.sign! consumer_secret: @secret

        post @path, params: @request.parameters
      end

      it "responds with a redirect" do
        expect(response).to have_http_status(:redirect)
      end

      it "includes a JWT value in the redirection path" do
        base_path = Rails.application.config.x.redirect_on_lti_auth.sub('JWT_VALUE','')
        jwt_matcher = '[A-Za-z0-9\-_=]+\.[A-Za-z0-9\-_=]+\.?[A-Za-z0-9\-_.+/=]*$'
        valid_path = Regexp.new "^#{base_path}#{jwt_matcher}$"

        expect(response.headers['Location']).to match(valid_path)
      end
    end
  end

end
