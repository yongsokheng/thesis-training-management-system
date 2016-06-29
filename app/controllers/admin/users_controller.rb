class Admin::UsersController < ApplicationController
  include StatisticData

  load_and_authorize_resource
  before_action :load_role, except: [:index, :show, :destroy]

  def index
    if current_user.is_admin?
      @users = User.order name: :asc
    else
      courses = current_user.user_courses.pluck :course_id
      @users = User.find_by_course courses
    end
    add_breadcrumb_index "users"
  end

  def new
    add_breadcrumb_path "users"
    add_breadcrumb_new "users"
  end

  def create
    if @user.save
      flash[:success] = flash_message "created"
      redirect_to admin_users_path
    else
      flash[:failed] = flash_message "not_created"
      render :new
    end
  end

  def edit
    add_breadcrumb_path "users"
    add_breadcrumb @user.name, user_path(@user)
    add_breadcrumb_edit "users"
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = flash_message "updated"
      redirect_to admin_users_path
    else
      flash[:failed] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:alert] = flash_message "not_deleted"
    end
    redirect_to admin_users_path
  end

  def show
    add_breadcrumb_path "users"

    @activities = PublicActivity::Activity.user_activities(@user.id).recent.limit(20).decorate
    @user_courses = @user.user_courses
    @finished_courses = @user_courses.course_finished
    @inprogress_course = @user_courses.course_progress.last

    if @inprogress_course
      @user_subjects = @inprogress_course.user_subjects
      statistic_task_of_user
    end

    @note = Note.new
    @notes = Note.load_notes @user, current_user

    add_breadcrumb @user.name
  end

  private
  def user_params
    params.require(:user).permit User::ATTRIBUTES_PARAMS
  end

  def load_role
     @roles = Role.all
  end
end
