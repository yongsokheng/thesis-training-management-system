require Rails.root.join("lib", "rails_admin", "show_subject.rb")
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::ShowSubject)
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
  end
end
