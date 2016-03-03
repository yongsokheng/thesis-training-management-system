class CourseSubject < ActiveRecord::Base
  include PublicActivity::Model
  include InitUserSubject

  after_create :create_user_subjects_when_add_new_subject
  after_create :create_course_subject_tasks
  before_create :init_position
  after_destroy :reorder_position

  tracked only: [:create, :destroy, :start_subject, :close_subject],
    owner: ->(controller, model) {controller.current_user},
    recipient: ->(controller, model) {model && model.course}

  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy

  belongs_to :subject
  belongs_to :course
  has_many :user_subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  scope :order_by_position, ->position{where "position = ?", position - Settings.position.index}

  accepts_nested_attributes_for :tasks, allow_destroy: true,
    reject_if: proc {|attributes| attributes["name"].blank?}
  enum status: [:init, :progress, :finish]

  def start_subject
    self.update_attributes status: :progress
  end

  private
  def create_user_subjects_when_add_new_subject
    create_user_subjects course.user_courses, [self], course_id, course.init?
  end

  def create_course_subject_tasks
    subject.task_masters.each do |task_master|
      Task.create course_subject_id: id,
        task_master_id: task_master.id
    end
  end

  def init_position
    if course.course_subjects.count == Settings.position.check_position
      self.position = Settings.position.index
    else
      @max = course.course_subjects.pluck(:position).max
      self.position = @max + Settings.position.index
    end
  end

  def reorder_position
    a = course.course_subjects.order(position: :asc).map &:id
    course.course_subjects.order(position: :asc).each do |course_subject|
      course_subject.position = a.index(course_subject.id) + 1
      course_subject.save
    end
  end
end
