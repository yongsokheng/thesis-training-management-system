class Admin::ChangeStatusCoursesController < ApplicationController
  load_and_authorize_resource :course

  def update
    if @course.init?
      @course.start_course current_user
      flash[:success] = flash_message "start_course"
    elsif @course.progress?
      @course.finish_course current_user
      flash[:success] = flash_message "finish_course"
    elsif @course.finish?
      @course.reopen_course current_user
      flash[:success] = flash_message "reopen_course"
    else
      flash[:failed] = flash_message "course_not_upate"
    end
    redirect_to admin_course_path @course
  end
end
