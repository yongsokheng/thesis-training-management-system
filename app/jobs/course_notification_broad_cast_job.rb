class CourseNotificationBroadCastJob < ApplicationJob
  queue_as :default

  def perform course, key, current_user
    notification = Notification.create trackable_type: "Course",
      trackable_id: course.id, key: key, user_id: current_user
    course.users.each do |user|
      notification.user_notifications.create user_id: user.id
    end

    BroadCastService.new(notification, "channel_course_#{course.id}").broadcast
  end
end
