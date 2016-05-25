class Report < ActiveRecord::Base
  ATTRIBUTES_PARAMS = [:report_date, :working_duration, :lines_code,
    user_task_ids: []]

  enum working_duration: [:all_day, :half_day, :home]

  belongs_to :user

  has_many :report_details, dependent: :destroy
  has_many :user_tasks, through: :report_details
end
