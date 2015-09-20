class CourseSubject < ActiveRecord::Base
  include PublicActivity::Model
  include RailsAdminCourseSubject

  tracked only: [:create],
    owner: ->(controller, model) {controller.current_user},
    recipient: ->(controller, model) {model && model.course}

  belongs_to :subject
  belongs_to :course

  enum status: [:init, :progress, :finish]
end
