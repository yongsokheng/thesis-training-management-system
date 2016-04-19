class CourseSubject < ActiveRecord::Base
  include PublicActivity::Model
  include InitUserSubject
  include RankedModel
  ranks :order
  mount_uploader :image, ImageUploader

  after_create :create_tasks
  after_create :create_user_subjects_when_add_new_subject
  after_create :update_subject_course

  tracked only: [:create, :destroy, :start_subject, :close_subject],
    owner: ->(controller, model) {controller.current_user},
    recipient: ->(controller, model) {model && model.course}
  ATTRIBUTES_PARAMS = [:subject_name, :image, :subject_description, :subject_content,
    :postition, :course_id, :order_position]

  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy

  belongs_to :subject
  belongs_to :course
  has_many :user_subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  accepts_nested_attributes_for :tasks, allow_destroy: true,
    reject_if: proc {|attributes| attributes["name"].blank?}

  private
  def update_subject_course
    self.update_attributes subject_name: subject.name,
      subject_description: subject.description,
      subject_content: subject.content, image: subject.image
  end

  def create_user_subjects_when_add_new_subject
    create_user_subjects course.user_courses, [self], course_id, course.init?
  end

  def create_tasks
    subject.task_masters.each do |task_master|
      Task.create course_subject_id: id, name: task_master.name,
        image: task_master.image, content: task_master.content,
        description: task_master.description, task_master_id: task_master.id
    end
  end
end
