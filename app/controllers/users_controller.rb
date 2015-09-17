class UsersController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      sign_in @user, bypass: true
      redirect_to @user, notice: flash_message("updated")
    else
      flash[:alert] = flash_message "not_updated"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
