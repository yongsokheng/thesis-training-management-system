class UserCoursesController < ApplicationController
  before_action :load_course, only: :index

  def index
  end

  private
  def load_course
    if @user_course = current_user.user_courses.actived.last
      @course = @user_course.course 
      @user_subjects = @user_course.user_subjects
    end
  end
end
