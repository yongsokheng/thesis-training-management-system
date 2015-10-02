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
      can :destroy, :all
      can :index, :all
      can :new, :all
      can :edit, :all
      can :show, :all
      can :show_course, Course
      can [:edit, :update], User, id: user.id
      can [:index, :show, :update], UserSubject
      can :show_subject, Subject
      can :show_user, User

      cannot [:create, :update, :destroy], User
      cannot [:edit, :destroy], Course
      cannot [:edit, :destroy], CourseSubject
      cannot [:edit, :destroy], UserCourse

      can :start_course, Course do |course|
        course.init? && (user.owner_course(course) || user.leader_course(course))
      end
      can :finish_course, Course do |course|
        course.progress? && (user.owner_course(course) || user.leader_course(course))
      end
      can [:finish_course_subject, :start_course_subject], Course do |course|
        user.owner_course(course)|| user.leader_course(course)
      end
      can [:edit, :destroy, :edit_course], Course do |course|
        user.leader_course course
      end
      can [:add_trainee_to_course, :add_subjects_to_course], Course do |course|
        !course.finish? && (user.owner_course(course) || user.leader_course(course))
      end
      can :edit_supervisor_to_course, Course do |course|
        user.leader_course course
      end
      can [:edit, :destroy], UserCourse do |user_course|
        user.owner_course(user_course.course) || user.leader_course(user_course.course)
      end
      can [:edit, :destroy], CourseSubject do |course_subject|
        user.owner_course(course_subject.course) || user.leader_course(course_subject.course)
      end
    else
      can [:index, :show], Course
      can [:index, :show], Subject
      can [:index, :show, :update], UserSubject
      can [:edit, :update], User, id: user.id
      can :show, User
    end
  end
end
