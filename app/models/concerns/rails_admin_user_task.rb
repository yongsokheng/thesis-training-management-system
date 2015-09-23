module RailsAdminUserTask
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :user do
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].name}",
              href: "user/#{bindings[:object].id}")
          end
        end

        field :task do
          formatted_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].name}",
              href: "task/#{bindings[:object].id}")
          end
        end
      end

      edit do
        field :user
        field :task
      end
    end
  end
end
