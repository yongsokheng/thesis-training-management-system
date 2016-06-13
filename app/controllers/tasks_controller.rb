class TasksController < ApplicationController
  load_and_authorize_resource
  load_and_authorize_resource :course_subject
  before_action :load_user_subject, only: [:create, :edit, :update, :destroy]
  before_action :add_task_info, only: [:create]

  def create
    if @task.save
      flash[:success] = flash_message "created"
      @task.user_tasks.create user: current_user, user_subject: @user_subject
    else
      flash[:failed] = flash_message "not_created"
    end
    redirect_to :back
  end

  def edit
    @user_course = UserCourse.find_by user: current_user,
      course: @course_subject.course
  end

  def update
    if @task.update_attributes task_params
      flash[:success] = flash_message "updated"
      redirect_to course_subject_user_task_path @course_subject,
        @task.user_tasks.first
    else
      flash[:failed] = flash_message "not_updated"
      render :edit
    end
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
    @task.course_subject = @course_subject
  end

  def load_user_subject
    @user_subject = UserSubject.find_by user: current_user,
      course_subject: @course_subject
  end
end
