module RailsAdmin
  module Config
    module Actions
      class ShowCourse < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          "icon-info-sign"
        end

        register_instance_option :http_methods do
          [:get, :post]
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :route_fragment do
          custom_key.to_s
        end

        register_instance_option :controller do
          proc do
            @course = object
            @members = object.users
          end
        end
      end
    end
  end
end
