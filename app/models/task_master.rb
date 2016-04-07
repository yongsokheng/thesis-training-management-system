class TaskMaster < ActiveRecord::Base
  belongs_to :subject
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true

  after_create :create_course_tasks

  private
  def create_course_tasks
    subject.course_subjects.each do |course_subject|
      Task.create name: name, avatar: avatar, description: description,
        content: content, course_subject_id: course_subject.id,
        task_master_id: id
    end
  end
end
