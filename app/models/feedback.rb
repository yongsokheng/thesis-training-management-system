class Feedback < ApplicationRecord

  FEEDBACK_PARAMS = [:subject, :content]

  belongs_to :user

  validates :subject, presence: true
  validates :content, presence: true

  delegate :name, to: :user, prefix: true, allow_nil: true
end
