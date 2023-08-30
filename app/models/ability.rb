class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, [Group, Trade], user_id: user.id
    can :read, [Group, Trade]
  end
end
