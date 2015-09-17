class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :subject
  belongs_to :user_course
  has_many :user_tasks, dependent: :destroy

  accepts_nested_attributes_for :user_tasks
end
