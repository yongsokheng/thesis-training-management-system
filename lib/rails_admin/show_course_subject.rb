module RailsAdmin
  module Config
    module Actions
      class ShowCourseSubject < RailsAdmin::Config::Actions::Base
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
          [:get, :post]
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
            if request.get?
              @course_subject = CourseSubject.find params[:subject]
              @course = @course_subject.course
              @subject = @course_subject.subject
              @tasks = @course_subject.tasks
              @activities = PublicActivity::Activity.subject_activities(@course_subject.id).
                recent.limit(20).decorate
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
