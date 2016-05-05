class TasksController < ApplicationController
  load_and_authorize_resource
  load_and_authorize_resource :course_subject
  before_action :load_user_subject, only: [:edit, :update, :destroy]
  before_action :add_task_info, only: [:create]

  def create
    if @task.save
      flash[:success] = flash_message "created"
    else
      flash[:failed] = flash_message "not_created"
    end
    redirect_to :back
  end

  def update
    @old_assigned_trainee = @task.assigned_trainee
    if @task.update_attributes task_params
      flash[:success] = flash_message "updated"
    else
      flash[:failed] = flash_message "not_updated"
    end
    unless params[:task][:assigned_trainee_id].nil?
      @task.change_user_task @old_assigned_trainee
    end
    redirect_to :back
  end

  def destroy
    if @task.destroy
      flash[:success] = flash_message "deleted"
      redirect_to course_subject_path(@course_subject.course, @user_subject.subject)
    else
      flash[:failed] = flash_message "not_deteletd"
      redirect_to :back
    end
  end

  private
  def task_params
    params.require(:task).permit Task::ATTRIBUTES_PARAMS
  end

  def add_task_info
    @task.create_by_trainee = current_user.is_trainee?
    @task.owner = current_user
    @task.course_subject = @course_subject
  end

  def load_user_subject
    @user_subject = UserSubject.find_by user: @task.assigned_trainee,
      course_subject: @course_subject
  end
end
