module RailsAdminCourse
  extend ActiveSupport::Concern
  included do
    rails_admin do
      edit do
        field :name
        field :description
        field :status
      end
      list do
        field :name
        field :description
        field :status
      end
    end
  end
end
