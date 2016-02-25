class Task < ActiveRecord::Base


  belongs_to :course_subject
  has_many :user_tasks, dependent: :destroy
end
