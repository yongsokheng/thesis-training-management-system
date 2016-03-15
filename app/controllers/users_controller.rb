class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @activities = PublicActivity::Activity.user_activities(@user.id).recent.limit(20).decorate
    if @user_course = @user.user_courses.actived.last
      @user_subjects = @user_course.user_subjects
      @user_subject = UserSubject.find params[:id]
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

  def edit
  end

  def update
    if @user.update_attributes user_params
      sign_in @user, bypass: true
      redirect_to @user, notice: flash_message("updated")
    else
      flash[:alert] = flash_message "not_updated"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
