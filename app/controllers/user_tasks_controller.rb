class UserTasksController < ApplicationController
  load_and_authorize_resource
  before_action :load_subject, only: [:edit, :update]

  def update
    if @user_task.update_attributes user_task_params
      flash[:success] = flash_message "updated"
      redirect_to subject_path(@subject)
    else
      flash[:failed] = flash_message "not updated"
      render :edit
    end
  end

  private
  def user_task_params
    params.require(:user_task).permit :spent_time, :estimated_time,
      :redmine_task_id, :status
  end

  def load_subject
    @subject = @user_task.user_subject.course_subject.subject
  end
end
