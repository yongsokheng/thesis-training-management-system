class Course < ActiveRecord::Base
  include RailsAdminCourse
  include PublicActivity::Model
  tracked only: [:finish_course, :start_course],
    owner: ->(controller, model) {controller.current_user}

  validates :name, presence: true

  has_many :course_subjects, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :subjects, through: :course_subjects

  enum status: [:init, :progress, :finish]

  after_update :create_user_subjects, if: :progress?

  private
  def create_user_subjects
    user_courses.each do |user_course|
      course_subjects.each do |course_subject|
        UserSubject.create course_id: id,
          user_id: user_course.user_id,
          subject_id: course_subject.subject_id,
          user_course_id: user_course.id
      end
    end
  end
end
