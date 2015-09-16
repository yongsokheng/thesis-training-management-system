class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.page(params[:page]).per 5
  end

  def new
  end

  def create
    if @user.save
      flash[:success] = flash_message "created"
      redirect_to new_admin_users_path
    else
      flash[:fail] = flash_message "not_created"
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash.now[:success] = flash_message "deleted"
    else
      flash.now[:failed] = flash_message "not_deleted"
    end
    respond_to do |format|
      format.html {redirect_to admin_users_path}
      format.js
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :role,
      :password, :password_confirmation
  end
end
