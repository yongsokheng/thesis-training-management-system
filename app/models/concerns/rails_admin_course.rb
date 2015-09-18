module RailsAdminCourse
  extend ActiveSupport::Concern
  included do
    rails_admin do
      list do
        field :name
        field :description
        field :status
      end
    end
  end
end
