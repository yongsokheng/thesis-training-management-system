module RailsAdmin
  module Config
    module Actions
      class StartCourseSubject < RailsAdmin::Config::Actions::Base
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
            @course_subject = CourseSubject.find params[:course_subject_id]
            if @course_subject.update_attributes status: Settings.course_subject.start
              flash[:success] = flash_message "updated"
              @course_subject.create_activity :start_subject
            else
              flash[:danger] = flash_message "not_updated"
            end
            respond_to do |format|
              format.html {redirect_to :back}
              format.js do
                render "rails_admin/main/order",
                  locals: {course_subjects: object.course_subjects.order(position: :asc),
                  course: object}
              end
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
