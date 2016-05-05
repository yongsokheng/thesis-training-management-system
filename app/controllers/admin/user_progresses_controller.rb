class Admin::UserProgressesController < ApplicationController
  load_and_authorize_resource

  def index
    @user_progress = UserProgress.new
    add_breadcrumb_index "user_progresses"
  end

  def new
    add_breadcrumb_path "user_progresses"
    add_breadcrumb_new "user_progresses"
  end

  def create
    if @user_progress.save
      flash[:success] = flash_message "created"
      redirect_to admin_user_progresses_path
    else
      flash[:failed] = flash_message "not_created"
      render :new
    end
  end

  def edit
    add_breadcrumb_path "user_progresses"
    add_breadcrumb @user_progress.name
    add_breadcrumb_edit "user_progresses"
  end

  def update
    if @user_progress.update_attributes user_progress_params
      flash[:success] = flash_message "updated"
      redirect_to :back
    else
      flash[:failed] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if @user_progress.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:failed] = flash_message "not_deleted"
    end

    redirect_to :back
  end

  private
  def user_progress_params
    params.require(:user_progress).permit UserProgress::ATTRIBUTES_PARAMS
  end
end
