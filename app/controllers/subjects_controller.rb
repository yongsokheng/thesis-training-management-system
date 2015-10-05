class SubjectsController < ApplicationController
  before_action :load_course, only: :update
  before_action :check_status, only: :update
  before_action :check_status_subject, only: :update

  def show
    @user_subject = UserSubject.find params[:id]
    @user_subject.course_subject.tasks.each do |task|
      @user_subject.user_tasks.find_or_initialize_by task_id: task.id,
        user_id: current_user.id
    end
    @course = @user_subject.user_course.course
    @activities = PublicActivity::Activity.course_activities(@course.id).
      recent.limit(20).decorate
  end

  def update
    if @user_subject.update_attributes finish: true
      @user_subject.create_activity :finish_subject
      flash[:success] = flash_message "updated"
    else
      flash[:danger] = flash_message "not_updated"
    end
    redirect_to course_subject_path @user_course.course, @user_subject
  end

  private
  def load_course
    @user_subject = UserSubject.find params[:subject_id]
    @user_course = @user_subject.user_course
  end

  def check_status
    redirect_to :back unless params[:status] == Settings.finish
  end

  def check_status_subject 
    redirect_to :back unless @user_subject.course_subject.progress?
  end
end
