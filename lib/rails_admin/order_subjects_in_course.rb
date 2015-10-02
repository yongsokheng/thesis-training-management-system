module RailsAdmin
  module Config
    module Actions
      class OrderSubjectsInCourse < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          false
        end

        register_instance_option :member do
          true
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :http_methods do
          [:get, :post, :put]
        end

        register_instance_option :route_fragment do
          custom_key.to_s
        end

        register_instance_option :action_name do
          custom_key.to_sym
        end

        register_instance_option :custom_key do
          key
        end

        register_instance_option :controller do
          proc do
            object.course_subjects.each do |course_subject|
              course_subject.position = params["course_subject"].index(course_subject.id.to_s) + 1
              course_subject.save
            end
          end
        end

        def key
          self.class.key
        end
      end
    end
  end
end
