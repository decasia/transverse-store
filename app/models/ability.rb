class Ability
  include CanCan::Ability

  def initialize(user)
    # TODO teacher and student roles
    can :manage, :all
  end
end
