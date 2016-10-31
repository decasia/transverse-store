module AuthHelpers
  def stub_current_user(group_id=1)
    @user = instance_double('User', current_group_id: group_id)
    allow(controller).to receive(:current_user).and_return(@user)
  end
end
