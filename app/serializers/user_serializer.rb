class UserSerializer < ActiveModel::Serializer
  # TODO support scoping by current_user, only return email to current user
  attributes :id,
    :username,
    :email,
    :group_data

  link(:self) { user_path(object.id) }
end
