class CourseSubject < ActiveRecord::Base
  include PublicActivity::Model
  include InitUserSubject
  mount_uploader :image, ImageUploader
  include RankedModel
  ranks :row_order

  after_create :create_tasks
  after_create :create_user_subjects_when_add_new_subject
  after_create :update_subject_course

  ATTRIBUTES_PARAMS = [:subject_name, :image, :subject_description, :subject_content,
    :postition, :course_id, :row_order_position]

  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy

  belongs_to :subject
  belongs_to :course
  has_many :user_subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  delegate :name, to: :course, prefix: true, allow_nil: true

  accepts_nested_attributes_for :tasks, allow_destroy: true,
    reject_if: proc {|attributes| attributes["name"].blank?}

  private
  def update_subject_course
    self.update_attributes subject_name: subject.name,
      subject_description: subject.description,
      subject_content: subject.content, image: subject.image
  end

  def create_user_subjects_when_add_new_subject
    trainee_role = Role.find_by name: "trainee"
    create_user_subjects course.user_courses.find_user_by_role(trainee_role.id),
      [self], course_id
  end

  def create_tasks
    subject.task_masters.each do |task_master|
      Task.create course_subject_id: id, name: task_master.name,
        content: task_master.content, description: task_master.description,
        task_master_id: task_master.id
    end
  end
end
