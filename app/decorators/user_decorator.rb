class UserDecorator < Draper::Decorator
  delegate_all

  def user_course_last_actived
    courses.last
  end

  def allow_access_admin
    role.allow_access_admin  
  end
end
