class ReportsController < ApplicationController
  load_and_authorize_resource

  def new
    @user_tasks = current_user.user_tasks.user_task_of_subject_progress
  end
end
