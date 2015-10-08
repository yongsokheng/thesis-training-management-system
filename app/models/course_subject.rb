class CourseSubject < ActiveRecord::Base
  include PublicActivity::Model
  include RailsAdminCourseSubject
  include InitUserSubject

  after_create :create_user_subjects_when_add_new_subject
  after_create :create_course_subject_tasks
  before_create :init_position

  tracked only: [:create, :destroy],
    owner: ->(controller, model) {controller.current_user},
    recipient: ->(controller, model) {model && model.course},
    params: {
      subject: proc {|controller, model| model.subject}
    }
  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy

  belongs_to :subject
  belongs_to :course
  has_many :user_subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  scope :order_by_position, ->position{where "position = ?", position - Settings.position.index}

  accepts_nested_attributes_for :tasks, allow_destroy: true,
    reject_if: proc {|attributes| attributes["name"].blank?}
  enum status: [:init, :progress, :finish]

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
end
