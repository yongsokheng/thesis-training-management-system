class Admin::TaskMastersController < ApplicationController
  load_resource :subject
  def index
    @task_masters = @subject.task_masters
  end
end
