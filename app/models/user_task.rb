class UserTask < ActiveRecord::Base
  include PublicActivity::Model

  tracked only: [:create],
    owner: ->(controller, model) {controller.current_user},
    recipient: ->(controller, model) {model.user_subject.course_subject}
  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy

  belongs_to :task
  belongs_to :user_subject
  belongs_to :user

  delegate :name, to: :task

  before_create :init_relation_user
  after_update :subject_progress

  private
  def init_relation_user
    self.user_id = self.user_subject.user_id
  end

  def subject_progress
    if self.status == Settings.tasks.statuses.closed
      total_time = self.user_subject.total_time_task_closed
      total_time += self.estimated_time.to_f
      self.user_subject.update_attributes(total_time_task_closed: total_time, progress: total_time * 100 /
        (self.user_subject.during_time * Settings.hours_working_day))
    end
  end
end
