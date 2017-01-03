require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:firstname) }
  it { is_expected.to respond_to(:lastname) }
  it { is_expected.to respond_to(:is_admin) }
  it { is_expected.to respond_to(:is_instructor) }
  it { is_expected.to respond_to(:lms_role) }
  it { is_expected.to respond_to(:lms_context_title) }

  # provided by has_secure_password
  it { is_expected.to respond_to(:password=) }
  it { is_expected.to respond_to(:password_confirmation=) }
  it { is_expected.to respond_to(:authenticate) }

  context 'with token requests' do
    before do
      params = {
        auth: {
          username: 'Testable',
          password: 'Password'
        }
      }
      @request = double(params: params)
      @user = User.create username: "Testable"
    end
    it 'should integrate with Knock token auth' do
      expect(User.from_token_request(@request)).to eq(@user)
    end
  end

  context 'with groups' do
    before do
      group1 = instance_double('Group', name: 'Class A', description: 'Foo', id: 1)
      group2 = instance_double('Group', name: 'Class B', description: 'Bar', id: 2)
      @user = User.new(username: 'Tester', current_group_id: 1)
      allow(@user).to receive(:groups) { [group1, group2] }
    end

    it 'should provide serialized group data' do
      expect(@user.group_data).to eq [
        {
          name: 'Class A',
          description: 'Foo',
          id: 1,
          current: true
        },
        {
          name: 'Class B',
          description: 'Bar',
          id: 2,
          current: false
        }
      ]
    end

    it 'should have a current group' do
      expect(@user.current_group_id).to eq 1
    end

    it 'should let you change to a valid group' do
      @user.change_group(2)
      expect(@user.current_group_id).to eq 2
    end

    it 'should not let you change to an invalid group' do
      expect {
        @user.change_group(3)
      }.to raise_error 'Invalid group ID'
    end

  end

end
