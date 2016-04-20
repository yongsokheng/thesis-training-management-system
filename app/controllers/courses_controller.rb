class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :load_course, only: [:show, :index]

  def index
  end

  def show
    @users = @course.users
    @roles = Role.not_admin
  end

  private
  def load_course
    @user_courses = current_user.user_courses_active
    @course_active_last = @user_courses.last
  end
end
