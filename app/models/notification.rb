class Notification < ApplicationRecord
  belongs_to :user

  has_many :user_notifications, dependent: :destroy

  enum key: [:start, :finish, :reopen]
end
