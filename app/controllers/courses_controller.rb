class CoursesController < ApplicationController
  before_action :load_course, only: :show

  def show
  end

  private
  def load_course
    if @user_course = current_user.user_courses.actived.last
      @course = @user_course.course
      @user_subjects = @user_course.user_subjects.joins(:course_subject)
        .order "course_subjects.position"
      @activities = PublicActivity::Activity.course_activities(@course.id).
        recent.limit(20).decorate
    end
  end
end
