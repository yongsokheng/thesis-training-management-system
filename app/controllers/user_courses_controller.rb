class UserCoursesController < ApplicationController
  load_and_authorize_resource

  def show
    @course = @user_course.course
    @user_subjects = @user_course.user_subjects
  end
end
