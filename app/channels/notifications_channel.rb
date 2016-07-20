class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    current_user.courses.each do |course|
      stream_from "channel_course_#{course.id}"
    end
  end

  def unsubscribed
  end
end
