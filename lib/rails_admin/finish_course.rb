module RailsAdmin
  module Config
    module Actions
      class FinishCourse < RailsAdmin::Config::Actions::Base
        register_instance_option :visible? do
          authorized?
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          "icon-ban-circle"
        end

        register_instance_option :pjax? do
          true
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

        def key
          self.class.key
        end

        register_instance_option :controller do
          Proc.new do
            object.update_attributes status: 2
            object.create_activity :finish_course, recipient: object
            @course_subjects = object.course_subjects
            @course_subjects.each do |course_subject|
              course_subject.update_attributes active: Settings.course_subject.finish unless course_subject.finish?
            end
            redirect_to :back, notice: t("flashs.messages.finish_course", course: object.name)
          end
        end
      end
    end
  end
end
