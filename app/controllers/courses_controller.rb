class CoursesController < ApplicationController
  before_action :load_course, only: :show

  def show
    if params.has_key? :subject
      @user_subject = @user_subjects.find params[:subject]
      @user_subject.subject.tasks.each do |task|
        @user_subject.user_tasks.find_or_initialize_by task_id: task.id,
          user_id: current_user.id
      end
    end
  end

  private
  def load_course
    if @user_course = current_user.user_courses.actived.last
      @course = @user_course.course
      @user_subjects = @user_course.user_subjects
      @activities = PublicActivity::Activity.course_activities(@course.id).
        recent.limit(20).decorate
    end
  end
end
