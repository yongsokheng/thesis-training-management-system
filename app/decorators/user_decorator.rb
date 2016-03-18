class UserDecorator < Draper::Decorator
  delegate_all

  def user_course_last_actived
    courses.last
  end

  def permission_course_master
    role.permissions.find_by model_class: "CourseMaster"
  end

  def permission_course
    role.permissions.find_by model_class: "Course"
  end
end
