class UserTask < ApplicationRecord
  include PublicActivity::Model

  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity",
    dependent: :destroy

  belongs_to :task
  belongs_to :user_subject
  belongs_to :user

  delegate :id, :name, :image_url, :description, to: :task, prefix: true, allow_nil: true
  delegate :name, to: :user, prefix: true, allow_nil: true
  delegate :description, to: :task, prefix: true, allow_nil: true

  validates_numericality_of :score, allow_nil: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100

  scope :user_task_of_subject_progress,
    -> {joins(:user_subject).where "user_subjects.status = ?",
      UserSubject.statuses[:progress]}

  after_update :subject_progress

  enum status: [:in_progress, :finished]

  def nil_master?
    task.task_master_id.nil?
  end

  def create_by_trainee?
    task.create_by_trainee
  end

  def subject_in_progress?
    user_subject.progress?
  end

  private
  def subject_progress
    if finished?
      total_time = self.user_subject.total_time_task_closed
      total_time += self.estimated_time.to_f
      self.user_subject.update_attributes(total_time_task_closed: total_time, progress: total_time * 100 /
        (self.user_subject.during_time * Settings.hours_working_day))
    end
  end
end
