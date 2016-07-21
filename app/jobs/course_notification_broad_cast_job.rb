class CourseNotificationBroadCastJob < ApplicationJob
  queue_as :default

  def perform course, key, current_user
    notification = Notification.create trackable_type: "Course",
      trackable_id: course.id, key: key, user_id: current_user
    course.users.each do |user|
      notification.user_notifications.create user_id: user.id
    end

    content = I18n.t "notifications.keys.courses.#{notification.key}", data: course.name
    date = notification.created_at
    BroadCastService.new(course, content, date, "channel_course_#{course.id}").broadcast
  end
end
