class UserCourse < ActiveRecord::Base
  include RailsAdminUserCourse

  belongs_to :user
  belongs_to :course
  has_many :user_subjects, dependent: :destroy

  scope :actived, ->{where active: true}
end
