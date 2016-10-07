class UserSession
  def initialize(user)
    @user = user
  end

  delegate :user_name, to: :user
  delegate :email, to: :user
  delegate :groups, to: :user

  # TODO this should take a session object and return the currently specified group
  def current_group_id
    @user.groups.first.id
  end

end
