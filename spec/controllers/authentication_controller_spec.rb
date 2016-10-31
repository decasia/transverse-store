require 'rails_helper'
require 'controllers/auth_helpers'

RSpec.describe AuthenticationController, type: :controller do
  pending 'tests LTI integration'

  context 'with groups' do
    context 'with a valid user' do
      include AuthHelpers

      context 'with valid group id' do
        before do
          stub_current_user
          allow(@user).to receive(:change_group).with('2').and_return(true)
        end

        it 'allows you to change your group ID' do
          post :change_group, params: {group_id: 2}
          expect(response.status).to eq 200
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
