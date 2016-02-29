class Admin::SubjectsController < ApplicationController
  load_and_authorize_resource
  before_action :init_subject, only: [:show]

  def index
    @subject = Subject.new
    @subjects = Subject.all.recent
  end

  def show
    @task_masters = @subject.task_masters
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = flash_message "created"
      redirect_to admin_subjects_path
    else
      flash.now[:failed] = t "messages.admin.create.fail"
      render :new
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description,
      task_masters_attributes: [:id, :name, :description, :_destroy]
  end

  def init_subject
    @subject = Subject.find params[:id]
  end
end
