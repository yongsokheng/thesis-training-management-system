class UserSubjectNotificationBroadCastJob < ApplicationJob
  queue_as :default

  def perform user_subject, key, current_user
    notification = Notification.create trackable_type: "UserSubject",
      trackable_id: user_subject.id, key: key,
      user_id: current_user

    notification.user_notifications.create user_id: user_subject.user_id

    BroadCastService.new(notification, "channel_user_subject_#{user_subject.id}")
      .broadcast
  end
end
