class Ability
  include CanCan::Ability

  def initialize(user)
    group_id = user.current_group_id

    can [:index, :show], [Author, Work, User], group_id: group_id

    can [:index, :show, :update], Doc, group_id: group_id
    can [:index, :show, :create, :update], Note, group_id: group_id
    can [:index, :show, :create, :update], Term, group_id: group_id
    can [:index, :show], DocVersion, group_id: group_id

    can [:index, :show], User, group_id: group_id

    if user.is_instructor?
      can [:create, :update, :destroy], Author, group_id: group_id
      can [:create, :update, :destroy], Work, group_id: group_id
      can [:create, :destroy], Doc, group_id: group_id
      can [:destroy], Note, group_id: group_id
      can [:destroy], Term, group_id: group_id
    end

  end
end
