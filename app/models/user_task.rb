class UserTask < ActiveRecord::Base
  belongs_to :task
  belongs_to :user_subject
  belongs_to :user
end
