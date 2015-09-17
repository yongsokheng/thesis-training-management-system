module RailsAdminUser
  extend ActiveSupport::Concern
  included do
    rails_admin do
      edit do
        field :name
        field :role
        field :email
        field :password
      end
    end
  end
end
