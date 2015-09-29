module RailsAdminTask
  extend ActiveSupport::Concern

  included do
    rails_admin do
      visible false
      list do
        field :name do
          formatted_value do
            bindings[:view].content_tag :a, "#{bindings[:object].name}",
              href: "/admin/task/#{bindings[:object].id}"
          end
        end
        field :description
        field :subject
      end

      edit do
        field :name
        field :description
      end
    end
  end
end
