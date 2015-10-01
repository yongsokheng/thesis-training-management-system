module RailsAdminUser
  extend ActiveSupport::Concern
  included do
    rails_admin do
      list do
        field :name do
          label "Name"
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].name}",
              href: "user/#{bindings[:object].id}/show_user")
          end
        end
        field :email
        field :role
      end

      edit do
        field :name
        field :role
        field :email
        field :password
        field :password_confirmation
      end

      show do
        field :name
        field :role
        field :email
        field :courses
        field :subjects
      end
    end
  end
end
