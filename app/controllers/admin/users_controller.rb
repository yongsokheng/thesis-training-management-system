class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  before_action :load_role, except: [:index, :show, :destroy]

  def create
    if @user.save
      flash[:success] = flash_message "created"
      redirect_to admin_users_path
    else
      flash[:failed] = flash_message "not_created"
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = flash_message "updated"
      redirect_to admin_users_path
    else
      flash[:failed] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:alert] = flash_message "not_deleted"
    end
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit User::ATTRIBUTES_PARAMS
  end

  def load_role
     @roles = Role.all
  end
end
