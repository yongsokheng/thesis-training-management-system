class Ability
  include CanCan::Ability

  def initialize user
    if user.is_admin?
      can :manage, :all
    else
      user.role.permissions.each do |permission|
        model_class = case permission.model_class
        when "CourseMaster"
          "Course"
        when "Trainer"
          "User"
        else
          permission.model_class
        end

        can permission.action.to_sym, model_class.constantize
      end
    end
  end
end
