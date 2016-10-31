class User < ApplicationRecord
  has_and_belongs_to_many :groups
  has_secure_password validations: false

  def change_group(new_id)
    new_id = Integer(new_id) # ensure integer format
    if self.groups.map(&:id).include?(new_id)
      self.current_group_id = new_id
    else
      raise 'Invalid group ID'
    end
  end

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
    if params[:full]
      {
        username: username,
        email: email,
        groups: group_data
      }
    else
      { username: username }
    end
  end

  # for Knock integration

  def self.from_token_request(request)
    username = request.params[:auth] && request.params[:auth][:username]
    self.find_by username: username
  end

end
