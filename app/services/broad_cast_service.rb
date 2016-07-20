class BroadCastService
  def initialize object, content, date, channel
    @object = object
    @content = content
    @date = date
    @channel = channel
  end

  def broadcast
    ActionCable.server.broadcast @channel, content: render_notification
  end

  private
  def render_notification
    ApplicationController.renderer.render(partial: "shared/notification",
      locals: {object: @object, content: @content, date: @date})
  end
end
