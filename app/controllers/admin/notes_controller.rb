class Admin::NotesController < ApplicationController
  load_and_authorize_resource
  load_and_authorize_resource :user

  def create
    if @note.save
      flash[:success] = flash_message "created"
    else
      flash[:failed] = flash_message "not_created"
    end
    redirect_to :back
  end

  def update
    if @note.update_attributes note_params
      flash[:success] = flash_message "updated"
      redirect_to edit_admin_user_evaluations_path(@user)
    else
      flash[:failed] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if @note.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:failed] = flash_message "not_deleted"
    end
    redirect_to :back
  end

  private
  def note_params
    params.require(:note).permit Note::ATTRIBUTES_PARAMS
  end
end
