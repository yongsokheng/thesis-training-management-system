class Admin::UserTasksController < ApplicationController
  load_and_authorize_resource
  load_and_authorize_resource :course_subject
  before_action :load_course, only: [:show, :edit]

  def show
  end

  def create
    if @user_task.save
      flash[:success] = flash_message "created"
    else
      flash[:failed] = flash_message "not created"
    end
    redirect_to :back
  end

  def update
    if @user_task.update_attributes user_task_params
      track_activity
      flash[:success] = flash_message "updated"
      redirect_to admin_course_subject_user_task_path(@course_subject, @user_task)
    else
      flash[:failed] = flash_message "not_updated"
      render :edit
    end
  end

  private
  def user_task_params
    params.require(:user_task).permit UserTask::ATTRIBUTES_PARAMS
  end

  def load_course
    @course = @course_subject.course
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
