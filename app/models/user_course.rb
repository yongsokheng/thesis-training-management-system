class UserCourse < ActiveRecord::Base
  include RailsAdminUserCourse
  include PublicActivity::Model
  include InitUserSubject

  after_create :create_user_subjects_when_assign_new_user

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

  private
  def create_user_subjects_when_assign_new_user
    create_user_subjects [self], course.course_subjects, course_id, course.init?
  end
end
