module RailsAdminCourseSubject
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :course
        field :subject
        field :status
      end

      edit do
        field :subject
        field :course
        field :status
      end
    end
  end
end
