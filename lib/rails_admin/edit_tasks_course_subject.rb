module RailsAdmin
  module Config
    module Actions
      class EditTasksCourseSubject < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          authorized? && bindings[:object].class == CourseSubject
        end

        register_instance_option :visible? do
          false
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          "icon-plus"
        end

        register_instance_option :http_methods do
          [:get, :post]
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :action_name do
          custom_key.to_sym
        end

        register_instance_option :route_fragment do
          custom_key.to_s
        end

        register_instance_option :controller do
          proc do
            @course_subject = object
            if request.post?
              course_subject_params = params.require(:course_subject).permit :id,
                tasks_attributes: [:id, :name, :description, :_destroy]
              if object.update_attributes course_subject_params
                flash[:success] = t "admin.actions.updated"
                redirect_to request.referer
              else
                render "edit_tasks_to_course_subject"
              end          
            end
          end
        end
      end
    end
  end
end
