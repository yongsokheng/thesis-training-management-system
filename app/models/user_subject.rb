class UserSubject < ActiveRecord::Base
  include PublicActivity::Model
  tracked only: [:finish_subject],
          owner: ->(controller, model) {controller.current_user},
          recipient: ->(controller, model) {model && model.user}

  belongs_to :user
  belongs_to :course
  belongs_to :subject
  belongs_to :user_course
  has_many :user_tasks, dependent: :destroy

  accepts_nested_attributes_for :user_tasks
end
