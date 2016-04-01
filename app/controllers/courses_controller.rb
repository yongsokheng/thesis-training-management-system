class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :load_course, only: [:show, :index]

  def index
    @courses = current_user.user_courses.map(&:course).reverse
    @course_active_last = @user_course.course
  end

  def show
    @users = @course.users
    @roles = Role.not_admin
  end

  private
  def load_course
    if @user_course = current_user.user_courses.actived.last
      @course = @user_course.course
      @subjects = @course.subjects
      @course_subjects = @user_course.user_subjects.joins(:course_subject)
        .order "course_subjects.position"
      @activities = PublicActivity::Activity.course_activities(@course.id).
        recent.limit(20).decorate
    end
  end
end
