class TaskSubmissionsController < ApplicationController
  before_action :load_user_task, only: :create

  def create
    @user_task.update_attributes submission: params[:user_task][:submission]
    respond_to do |format|
      format.js
    end
  end

  def edit
    @user_task = UserTask.find params[:id]
    respond_to do |format|
      format.js
    end
  end

  def update
    @user_task = UserTask.find params[:id]
    @user_task.update_attributes submission: params[:user_task][:submission]
    respond_to do |format|
      format.js
    end
  end

  private
  def load_user_task
    @user_task = UserTask.find params[:user_task][:id]
  end
end
