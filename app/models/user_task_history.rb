class UserTaskHistory < ActiveRecord::Base
  belongs_to :user_task

  enum status: [:init, :in_progress, :finished]
end
