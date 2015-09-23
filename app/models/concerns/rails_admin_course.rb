module RailsAdminCourse
  extend ActiveSupport::Concern
  included do
    rails_admin do
      edit do
        field :name
        field :description
      end
      list do
        field :name do
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].name}",
              href: "course/#{bindings[:object].id}/show_course")
          end
        end
        field :description
        field :status
      end
    end
  end
end
