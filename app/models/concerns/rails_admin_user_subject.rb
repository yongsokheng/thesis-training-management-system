module RailsAdminUserSubject
  extend ActiveSupport::Concern

  included do
    rails_admin do
      visible false
      list do
        field :user do
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].name}",
              href: "user/#{bindings[:object].id}")
          end
        end

        field :course
        field :subject
        field :status
      end

      edit do
        field :user
        field :course
        field :subject
        field :status
      end
    end
  end
end
