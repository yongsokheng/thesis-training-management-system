class User < ActiveRecord::Base
  include RailsAdminUser
  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :courses, through: :user_courses
  has_many :course_subjects, through: :user_subjects
  has_many :tasks, through: :user_tasks

  has_many :course_leaders, class_name: UserCourse.name,
                            dependent: :destroy,
                            foreign_key: :leader_id,
                            inverse_of: :leader
  has_many :leading_courses, through: :course_leaders

  has_many :course_supervisors, class_name: UserCourse.name,
                                dependent: :destroy,
                                foreign_key: :supervisor_id,
                                inverse_of: :supervisor
  has_many :supervising_courses, through: :course_supervisors

  validates :name, presence: true, uniqueness: true
  validates :role, presence: true
  validates_confirmation_of :password

  devise :database_authenticatable, :rememberable, :trackable, :validatable
  enum role: [:admin, :supervisor, :trainee]

  scope :free_trainees, ->{self.trainee.where "id NOT IN (SELECT user_id
    FROM user_courses JOIN courses ON user_courses.course_id = courses.id
    WHERE (courses.status = 0 OR courses.status = 1) AND user_courses.user_id IS NOT NULL)"}

  def total_done_tasks user, course
    done_tasks = UserSubject.load_user_subject(user.id, course.id).map(&:user_tasks).flatten.count
  end

  def owner_course course
    return course.user_courses.find_by(supervisor_id: self.id) ? true :false
  end

  def leader_course course
    return course.user_courses.find_by(leader_id: self.id) ? true :false
  end

  private
  def password_required?
    new_record? ? super : false
  end
end
