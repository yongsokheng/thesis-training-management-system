class Report < ActiveRecord::Base
  belongs_to :user

  has_many :report_details, dependent: :destroy
end
