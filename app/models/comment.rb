class Comment < ApplicationRecord
  belongs_to :sender, class_name: User, foreign_key: :user_id
  belongs_to :user_task

  validates :content, presence: true

  delegate :name, to: :sender, prefix: true, allow_nil: true

  after_create :push_notification
end


def push_notification
  receiver_ids = self.user_task.comments.pluck(:user_id).uniq
  CommentBroadcastJob.perform_now self, receiver_ids
end
