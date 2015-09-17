class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.admin?
      can :access, :rails_admin
      can :dashboard
      can :manage, User
    elsif user.supervisor?
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
      cannot [:create, :update, :destroy], User
    else
      can [:index, :show], Course
      can [:index, :show], Subject
    end
  end
end
