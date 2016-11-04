require "rails_helper"
require 'lti_sample_data'

RSpec.describe "LTI auth", :type => :request do
  context 'with a valid group' do
    before do
      @key = SecureRandom.hex(16)
      @secret = SecureRandom.hex(16)
      @test_group = Group.create name: 'LTI Test',
        oauth_consumer_key: @key,
        oauth_consumer_secret: @secret
    end

    context 'with a valid request' do
      before do
        @headers = {
          'Content-Type' => 'application/x-www-form-urlencoded'
        }

        @request = SAMPLE_LTI_REQUEST
        @request['oauth_consumer_key'] = @key
      end

      pending 'valid requests redirect us with a valid JWT'
      pending "accepts x-www-url-encoded data" do
        # TODO we need to update the signature here to actually be valid!
        # currently the redirection succeeds but without a valid JWT token
        post "/auth/lti", @request, @headers
        expect(response).to have_http_status(:redirect)
      end
    end
  end

end
