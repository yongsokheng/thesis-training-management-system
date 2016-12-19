class FeedbacksController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    @feedback = current_user.feedbacks.new feedback_params
    if @feedback.save
      flash[:success] = flash_message "created"
      redirect_to new_feedback_path
    else
      render :new
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit Feedback::FEEDBACK_PARAMS
  end
end
