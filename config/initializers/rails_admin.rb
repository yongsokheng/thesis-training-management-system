require Rails.root.join("lib", "rails_admin", "show_subject.rb")
require Rails.root.join("lib", "rails_admin", "start_course.rb")
require Rails.root.join("lib", "rails_admin", "finish_course.rb")
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::ShowSubject)
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::StartCourse)
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::FinishCourse)

RailsAdmin.config do |config|

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with :cancan

  config.model "Task" do
    parent Subject
  end

  config.actions do
    dashboard                     # mandatory
    index                      # mandatory
    new do
      except "Task"
    end
    export
    bulk_delete
    show_subject
    show do
      except "Subject"
    end
    edit do
      except "Task"
    end
    delete
    show_in_app
    start_course do
      only Course
    end
    finish_course do
      only Course
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
