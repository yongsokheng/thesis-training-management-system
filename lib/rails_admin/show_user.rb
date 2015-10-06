module RailsAdmin
  module Config
    module Actions
      class ShowUser < RailsAdmin::Config::Actions::Base

        register_instance_option :visible? do
          authorized? && bindings[:object].class == User
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          "icon-info-sign"
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :breadcrumb_parent do
          [:index, bindings[:abstract_model]]
        end

        register_instance_option :http_methods do
          [:get]
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
            @user = object
            if @user_course = @user.user_courses.actived.last
              @user_subjects = @user_course.user_subjects
              @inprogress_course = @user_course.course
              @finished_courses = @user.courses.finish
              @user_subjects.each do |user_subject|
                user_subject.course_subject.tasks.each do |task|
                  user_subject.user_tasks.find_or_initialize_by task_id: task.id,
                    user_id: @user.id
                end
              end
            end
          end
        end
      end
    end
  end
end
