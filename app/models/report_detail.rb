class ReportDetail < ActiveRecord::Base
  belongs_to :report
  belongs_to :user_task
end
