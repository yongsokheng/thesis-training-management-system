class BroadCastService
  def initialize notification, channel
    @notification = notification
    @channel = channel
  end

  def broadcast
    ActionCable.server.broadcast @channel, content: render_notification
  end

  private
  def render_notification
    ApplicationController.renderer.render(partial: "shared/notification",
      locals: {notification: @notification})
  end
end
