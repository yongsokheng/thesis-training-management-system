module RailsAdminTaskMaster
  extend ActiveSupport::Concern

  included do
    rails_admin do
      visible false
      edit do
        field :name
        field :description
      end
    end
  end
end
