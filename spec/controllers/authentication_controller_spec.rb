require 'rails_helper'
require 'lti_sample_data'
require 'controllers/auth_helpers'

RSpec.describe AuthenticationController, type: :controller do
  context 'with LTI integration' do
    before do
      @key = SecureRandom.hex(16)
      @secret = SecureRandom.hex(16)
      @test_group = Group.create name: 'LTI Test',
        oauth_consumer_key: @key,
        oauth_consumer_secret: @secret
    end
    context 'with valid request' do
      before do
        # do oauth setup here
      end
      pending 'it prints success to the log'
      pending 'it redirects to the UI with a valid JWT token'
      pending 'it updates the user attributes'
      pending 'it validates that the nonce was not recently used'
    end
    context 'with invalid request' do
      pending 'it redirects to the UI without a valid JWT token'
    end
  end

  context 'with groups' do
    context 'with a valid user' do
      include AuthHelpers

      context 'with valid group id' do
        before do
          stub_current_user
          allow(@user).to receive(:change_group).with('2').and_return(true)
          allow(@user).to receive(:save)
        end

        it 'allows you to change your group ID' do
          post :change_group, params: {group_id: 2}
          expect(response.status).to eq 200
        end

        it 'persists the updated current_group_id' do
          post :change_group, params: {group_id: 2}
          expect(@user).to have_received(:save)
        end
      end

      context 'with invalid group id' do
        before do
          stub_current_user
          allow(@user).to receive(:change_group).with('3').and_raise('Invalid')
        end

        it 'does not let you pick an invalid ID' do
          post :change_group, params: {group_id: 3}
          expect(response.status).to eq 400
        end
      end
    end

    context 'without a valid user session' do
      it 'returns 401' do
        post :change_group, params: {group_id: 3}
        expect(response.status).to eq 401
      end
    end

    context 'without valid params' do
      it 'returns 400' do
        post :change_group, params: {nonsense: 'abcdefgh'}
        expect(response.status).to eq 400
      end
    end

  end

end
