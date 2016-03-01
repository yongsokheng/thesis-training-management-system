class Admin::AssignTraineesController < ApplicationController
  load_and_authorize_resource :course

  def edit
    @users = User.free_trainees(@course.id).page params[:page]
  end

  def update
    if @course.update_attributes assign_users_params
      flash[:success] = flash_message "updated"
    else
      flash[:danger] = flash_message "not updated"
    end
    redirect_to :back
  end

  private
  def assign_users_params
    params.require(:course).permit user_ids: []
  end

end
