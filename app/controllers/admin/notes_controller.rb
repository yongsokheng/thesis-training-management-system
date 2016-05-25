class Admin::NotesController < ApplicationController
  load_and_authorize_resource

  before_action :add_note_info, only: :create

  def create
    respond_to do |format|
      if @note.save
        flash.now[:success] = flash_message "created"
      end
      format.js
    end
  end

  private
  def note_params
    params.require(:note).permit Note::ATTRIBUTES_PARAMS
  end

  def add_note_info
    @note.author_id = current_user.id
    @note.user_id = params[:user_id]
  end
end
