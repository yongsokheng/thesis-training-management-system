class ReportsController < ApplicationController
  load_and_authorize_resource
  before_action :get_user_task, only: [:new, :create]

  def new
  end

  def create
    @report = current_user.reports.build report_params
    if @report.save
      flash[:success] = flash_message "created"
      redirect_to courses_path
    else
      flash[:failed] = flash_message "not_created"
      render :new
    end
  end
  
  private
  def report_params
    params.require(:report).permit Report::ATTRIBUTES_PARAMS
  end

  def get_user_task
    @user_tasks = current_user.user_tasks.user_task_of_subject_progress
  end
end
