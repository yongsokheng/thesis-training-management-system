class Admin::TaskMastersController < ApplicationController
  load_resource :subject
  def index
    @task_masters = @subject.task_masters

    add_breadcrumb_subjects
    add_breadcrumb @subject.name
    add_breadcrumb t("breadcrumbs.subjects.task_masters")
  end
end
