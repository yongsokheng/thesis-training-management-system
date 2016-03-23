class Admin::RolesController < ApplicationController
  load_and_authorize_resource

  def index
    @roles = Role.all
  end

  def create
    if @role.save
      flash[:success] = flash_message "created"
      redirect_to admin_roles_path
    else
      flash[:failed] = flash_message "not_created"
      redirect_to :new
    end
  end

  def edit
  end

  def update
    if @role.update_attributes role_params
      flash[:success] = flash_message "updated"
      redirect_to admin_roles_path
    else
      flash[:failed] = flash_message "not_update"
      render :edit
    end
  end

  def destroy
    if @role.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:failed] = flash_message "not_deleted"
    end
    redirect_to :back
  end

  private
  def role_params
    params.require(:role).permit :name
  end
end
