class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.admin?
      can :manage, User
    elsif user.supervisor?
      can :manage, [Course, Subject, Tasks]
    else
      can [:index, :show], Course
      can [:index, :show], Subject
    end
  end
end
