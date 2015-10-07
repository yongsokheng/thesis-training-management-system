class Task < ActiveRecord::Base
  include RailsAdminTask
  
  belongs_to :course_subject
  has_many :user_tasks, dependent: :destroy
end
