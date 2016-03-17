module SessionsHelper
  def current_user? user
    user == current_user
  end

  def user_course_last_actived
    current_user.courses.last
  end

  def permission_course_master
    current_user.role.permissions.find_by model_class: "CourseMaster"
  end
end
