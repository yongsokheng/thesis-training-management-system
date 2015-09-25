class Subject < ActiveRecord::Base
  include RailsAdminSubject

  has_many :tasks, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :tasks, allow_destroy: true,
   reject_if: proc {|attributes| attributes["name"].blank?}
end
