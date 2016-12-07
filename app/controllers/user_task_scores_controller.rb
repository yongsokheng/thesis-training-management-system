class UserTaskScoresController < ApplicationController
  authorize_resource class: false

  def update
    user_task = UserTask.find params[:id]
    if user_task.update_attributes score: params[:user_task][:score]
      flash.now[:success] = flash_message "updated"
    else
      flash.now[:error] = flash_message "not_updated"
    end

    respond_to do |format|
      format.js
    end
  end
end
