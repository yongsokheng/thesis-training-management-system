class UserTaskHistory < ActiveRecord::Base
  belongs_to :user_task

  enum status: [:init, :in_progress, :finished]

  scope :finished_in_day, ->date{where status: :finished, created_at: date}
end
