class Task < ActiveRecord::Base
  belongs_to :course_subject
  has_many :user_tasks, dependent: :destroy
  mount_uploader :image, ImageUploader

  ATTRIBUTES_PARAMS = [
    :name, :description, :content, :image
  ]

  scope :not_created_by_trainee, -> do
    where create_by_trainee: false, task_master_id: nil
  end

  scope :has_task_master, ->{where.not task_master_id: nil}
end
