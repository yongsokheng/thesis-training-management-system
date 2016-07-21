class UserNotification < ApplicationRecord
  belongs_to :notification
  belongs_to :user

  scope :not_seen, ->{where seen: false}
end
