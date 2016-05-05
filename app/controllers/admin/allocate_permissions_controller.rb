class Admin::AllocatePermissionsController < ApplicationController
  load_and_authorize_resource :role

  def edit
    add_breadcrumb_roles
    add_breadcrumb @role.name
    add_breadcrumb t("breadcrumbs.roles.edit")
    $model_classes.each do |model_class|
      Settings.roles.actions.each do |action|
        unless @role.permissions.find_by action: action, model_class: model_class
          @role.permissions.new model_class: model_class, action: action
        end
      end
    end
  end

  def update
    if @role.update_attributes role_params
      flash[:success] = flash_message "updated"
    else
      flash[:danger] = flash_message "not updated"
    end
    redirect_to :back
  end

  private
  def role_params
    params.require(:role).permit Role::ATTRIBUTES_PARAMS
  end
end
