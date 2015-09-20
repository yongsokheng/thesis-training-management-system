module RailsAdminSubject
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :name
        field :description
        field :tasks
      end

      edit do
        field :name
        field :description
        field :tasks
      end
    end
  end
end
