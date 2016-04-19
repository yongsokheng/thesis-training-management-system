class SubjectsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :course, only: [:index, :show]
  load_and_authorize_resource :subject, only: :show

  before_action :load_course, only: :update
  before_action :check_status, only: :update
  before_action :check_status_subject, only: :update

  def index
    @user_subjects = UserSubject.load_user_subject(current_user, @course)
  end

  def show
    @task_masters = @subject.task_masters
    @course_subject = CourseSubject.includes(:tasks,
      user_subjects: [user_tasks: :task]).find_by course_id: @course.id,
      subject_id: @subject.id
    @user_subjects = @course_subject.user_subjects
    @user_subject = @user_subjects.find{|user_subject| user_subject.user_id == current_user.id}
    @unassign_tasks = @course_subject.tasks.not_assigned_trainee
    @user_tasks = @user_subject.user_tasks
    @trainers = @user_subject.load_trainers
    @trainees = @user_subject.load_trainees
    @number_of_task = @user_subjects.joins(:user_tasks).count
    @number_of_task_new = @user_subjects.count_user_tasks Settings.tasks.statuses.new
    @number_of_task_in_progress = @user_subjects.count_user_tasks Settings.tasks.statuses.in_progress
    @number_of_task_resolved =  @user_subjects.count_user_tasks Settings.tasks.statuses.resolved
    @number_of_task_closed = @user_subjects.count_user_tasks Settings.tasks.statuses.closed
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
    redirect_to :back unless @user_subject.progress?
  end
end
