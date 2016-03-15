class Task < ActiveRecord::Base
  belongs_to :course_subject
  has_many :user_tasks, dependent: :destroy

  ATTRIBUTES_PARAMS = [
    :name, :description, :assigned_trainee_id, :course_subject_id
  ]

  scope :not_assigned_trainee, ->{where assigned_trainee_id: nil}

  after_create :create_user_task

  private
  def create_user_task
    unless self.assigned_trainee_id.nil?
      @course_subject = self.course_subject
      @user_subject = @course_subject.user_subjects.find_by(user_id: self.
        assigned_trainee_id)
      UserTask.create task_id: self.id, user_id: self.assigned_trainee_id,
        user_subject_id: @user_subject.id
    end
  end
end
