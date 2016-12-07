class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform comment, receiver_ids
    receiver_ids.each do |id|
      ActionCable.server.broadcast "channel_user_#{id}", comment: render_comment(comment)
    end
  end


  private
  def render_comment comment
    ApplicationController.renderer.render(partial: "comments/comment",
      locals: {comment: comment, sender: comment.sender})
  end
end
