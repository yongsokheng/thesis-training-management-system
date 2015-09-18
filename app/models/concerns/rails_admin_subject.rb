module RailsAdminSubject
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        sort_by :created_at
        field :name do
          formatted_value do
            bindings[:view].content_tag :a, "#{bindings[:object].name}",
              href: "/admin/subject/#{bindings[:object].id}/show_subject"
          end
        end
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
