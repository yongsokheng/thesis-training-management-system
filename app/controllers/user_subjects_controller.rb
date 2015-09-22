class UserSubjectsController < ApplicationController
  load_and_authorize_resource
  before_action :load_course

  def show
    @user_subject.subject.tasks.each do |task|
      @user_subject.user_tasks.find_or_initialize_by task_id: task.id,
        user_id: current_user.id
    end
  end

  def update
    if @user_subject.update_attributes user_subject_params
      flash[:success] = flash_message "updated"
    else
      flash[:danger] = flash_message "not_updated"
    end
    redirect_to [@user_course, @user_subject]
  end

  private
  def user_subject_params
    params.require(:user_subject).permit user_tasks_attributes: [:id, :task_id, :_destroy, :user_id]
  end

  def load_course
    @course = @user_subject.course
    @user_course = @user_subject.user_course
    @activities = PublicActivity::Activity.course_activities(@course.id).
      recent.limit(20).decorate
  end
end
