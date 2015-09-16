class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    if @user.save
      flash[:success] = t "flash.user.create_success"
      redirect_to new_admin_users_path
    else
      flash[:fail] = t "flash.user.create_fail"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :role,
      :password, :password_confirmation
  end
end
