class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :manage, User, id: user.id
      can :create, User, role: 'Employee'
      can :create, User, role: 'Manager'
    end
  end
end
