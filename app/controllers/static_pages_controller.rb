class StaticPagesController < ApplicationController
  def home
    @count_course_active = Course.progress.count
    @count_course = Course.count
    @count_user_inprogress = UserCourse.course_progress.count
    @count_user = User.count
  end

  def help
  end

  def contact
  end
end
