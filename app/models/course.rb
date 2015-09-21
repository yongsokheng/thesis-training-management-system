class Course < ActiveRecord::Base
  include RailsAdminCourse
  include PublicActivity::Model
  include InitUserSubject
  tracked only: [:finish_course, :start_course],
    owner: ->(controller, model) {controller.current_user}

  validates :name, presence: true

  has_many :course_subjects, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :subjects, through: :course_subjects

  enum status: [:init, :progress, :finish]

  def create_user_subjects_when_start_course
    create_user_subjects user_courses, course_subjects, id, false
  end
end
