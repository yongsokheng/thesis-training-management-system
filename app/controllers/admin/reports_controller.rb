class Admin::ReportsController < ApplicationController
  load_and_authorize_resource
  before_action :load_data, only: [:edit, :update]

  def index
    add_breadcrumb_index "reports"
  end

  def edit
  end

  def update
    if @report.update_attributes report_params
      flash[:success] = flash_message "updated"
      redirect_to admin_reports_path
    else
      render :edit
    end
  end

  def show
    @user_tasks = @report.user_tasks

    add_breadcrumb_path "reports"
    add_breadcrumb @report.report_name
  end

  def destroy
    if @report.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:failed] = flash_message "not_deleted"
    end
    redirect_to admin_reports_path
  end

  private
  def report_params
    params.require(:report).permit Report::ATTRIBUTES_PARAMS
  end

  def load_data
    user = @report.user
    @user_tasks = user.user_tasks.user_task_of_subject_progress

    add_breadcrumb_path "reports"
    add_breadcrumb @report.report_name, admin_report_path(@report)
    add_breadcrumb_edit "reports"
  end
end
