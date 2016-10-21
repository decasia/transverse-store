class UserSession
  # the purpose of this class is to keep track of which group a user
  # is currently using (and any other session-specific settings)

  def initialize(user, current_group_id)
    @user = user
    if user.groups.map(&:id).include? current_group_id
      @current_group_id = current_group_id
    else
      @current_group_id = user.groups.last.id
    end
  end

  delegate :username, to: :user
  delegate :email, to: :user
  delegate :groups, to: :user
  attr_reader :current_group_id
  attr_reader :user

  # serializable info about groups
  def group_data
    groups.map do |g|
      {
        name: g.name,
        description: g.description,
        id: g.id,
        current: g.id == current_group_id
      }
    end
  end

  def as_json(params)
    {
      username: username,
      email: email,
      groups: group_data
    }
  end
end
