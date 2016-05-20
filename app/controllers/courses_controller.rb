class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :load_course, only: [:index]

  def index
  end

  private
  def load_course
    @user_courses = current_user.user_courses_active
  end
end
