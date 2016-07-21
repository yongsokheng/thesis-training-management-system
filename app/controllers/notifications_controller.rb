class NotificationsController < ApplicationController
  def update
    notifications = current_user.user_notifications.not_seen
    notifications.update_all seen: true
    respond_to do |format|
      format.js
    end
  end
end
