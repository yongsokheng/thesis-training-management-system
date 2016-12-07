class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create user_task_id: params[:user_task_id],
      content: params[:content]
    respond_to do |format|
      format.js
    end
  end
end
