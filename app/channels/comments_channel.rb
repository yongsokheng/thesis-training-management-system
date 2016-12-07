class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "channel_user_#{current_user.id}"
  end

  def unsubscribed
  end
end
