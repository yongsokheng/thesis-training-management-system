class UserCourse < ActiveRecord::Base
  include RailsAdminUserCourse
  include PublicActivity::Model

  tracked only: [:create, :destroy],
    owner: ->(controller, model) {controller.current_user},
    recipient: ->(controller, model) {model && model.course},
    params: {
      user: proc {|controller, model| model.user}
    }

  belongs_to :user
  belongs_to :course
  has_many :user_subjects, dependent: :destroy

  scope :actived, ->{where active: true}
end
