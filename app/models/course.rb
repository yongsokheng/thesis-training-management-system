class Course < ActiveRecord::Base
  include PublicActivity::Model
  include InitUserSubject
  tracked only: [:finish_course, :start_course],
    owner: ->(controller, model) {controller.current_user}
  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy

  validate :check_day_present, on: [:create, :update]
  validate :check_end_date, on: [:create, :update]

  validates :start_date, presence: true unless :master?
  validates :end_date, presence: true unless :master?

  before_destroy :back_up_master if :master?

  has_many :children, class_name: Course.name, foreign_key: :parent_id
  belongs_to :parent, class_name: Course.name

  has_many :course_subjects, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :subjects, through: :course_subjects

  enum status: [:init, :progress, :finish]

  scope :recent, ->{order created_at: :desc}

  scope :active_course, ->{where status: "progress"}

  scope :masters,->{where parent_id: nil}
  scope :normal,->{where.not parent_id: nil}

  accepts_nested_attributes_for :user_courses, allow_destroy: true

  ATTRIBUTES_PARAMS = [user_courses_attributes: [:id, :user_id, :_destroy]]

  def create_user_subjects_when_start_course
    create_user_subjects user_courses, course_subjects, id, false
  end

  def check_day_present
    unless self.start_date.nil?
      self.errors.add :start_date, I18n.t("error.wrong_date") if
        self.start_date.to_date < Date.today
    end
  end

  def check_end_date
    unless self.start_date.nil?
      errors.add :end_date, I18n.t("error.wrong_end_date") if
        self.end_date < self.start_date
    end
  end

  def start_course
    self.update_attributes status: :progress
  end

  def finish_course
    self.update_attributes status: :finish
    self.user_subjects.update_all(status: Course.statuses[:finish])
  end

  def back_up_master
    self.children.each do |course|
      course.update_attributes name: self.name, description: self.description
      course.save
    end
  end

  def name
    self[:name] || parent.name unless self.new_record?
  end

  def description
    self[:description] || parent.description unless self.new_record?
  end

  private
  def master?
    parent_id.nil?
  end
end
