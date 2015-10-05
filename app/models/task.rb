class Task < ActiveRecord::Base
  include RailsAdminTask
  
  has_many :user_tasks, dependent: :destroy
end
