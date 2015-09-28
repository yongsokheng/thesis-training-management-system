class UserSubject < ActiveRecord::Base
  include PublicActivity::Model
  include RailsAdminUserSubject

  tracked only: [:finish_subject],
    owner: ->(controller, model) {controller.current_user},
    recipient: ->(controller, model) {model && model.course}

  belongs_to :user
  belongs_to :course
  belongs_to :subject
  belongs_to :user_course
  belongs_to :course_subject
  has_many :user_tasks, dependent: :destroy

  accepts_nested_attributes_for :user_tasks

  after_update :create_user_tasks, if: :finish?

  private
  def create_user_tasks
    self.subject.tasks.each do |task|
      UserTask.create_with(user_subject_id: self.id,
        user_id: user_course.id).find_or_create_by task_id: task.id
    end
  end
end
