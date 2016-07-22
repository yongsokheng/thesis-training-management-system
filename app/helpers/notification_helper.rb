module NotificationHelper
  def notification_content notification
    trackable = trackable_object notification.trackable
    data = "#{trackable.class.name} : #{trackable.name}"
    t "notifications.keys.#{notification.key}", data: data
  end

  def notification_image notification
    trackable = notification.trackable
    image_object = trackable_object trackable
    set_image image_object, Settings.image_size_40
  end

  def trackable_object trackable
    if trackable.is_a? Course
      object = trackable
    elsif trackable.is_a? UserSubject
      object = trackable.course_subject.subject
    end
  end

  def not_seen_notification
    if (size = current_user.user_notifications.not_seen.size) > 0
      size
    end
  end
end
