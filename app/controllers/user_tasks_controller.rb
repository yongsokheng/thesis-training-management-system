class UserTasksController < ApplicationController
  load_and_authorize_resource
  before_action :load_user_subject_course, only: :update
  before_action :load_course, only: [:show, :edit]

  def show
    @user_courses = @course.user_courses
    @user_subject = @user_task.user_subject
    @course_subject = @user_subject.course_subject
    @user_task_histories = @user_task.user_task_histories
  end

  def update
    @user_task_service = UserTaskService.new @user_task, user_task_params
    if @user_task_service.update
      track_activity
      flash[:success] = flash_message "updated"
      redirect_to course_subject_path(@user_course, @user_subject.subject)
    else
      flash[:failed] = flash_message "not_updated"
      render :edit
    end
  end

  private
  def user_task_params
    params.require(:user_task).permit UserTask::ATTRIBUTES_PARAMS
  end

  def load_user_subject_course
    @user_subject = @user_task.user_subject
    @user_course = @user_task.user_subject.course
    @old_status = @user_task.status
  end

  def load_course
    @course = @user_task.user_subject.course
  end

  def track_activity
    new_status = @user_task.status
    unless @old_status == new_status
      @user_task.create_activity key: "user_task.change_status",
        owner: current_user, parameters: {old_status: @old_status,
          new_status: new_status}
    end
  end
end
