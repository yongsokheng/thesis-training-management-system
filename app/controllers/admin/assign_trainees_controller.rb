class Admin::AssignTraineesController < ApplicationController
  load_and_authorize_resource :course

  def edit
    @trainees = Role.find_by(name: "trainee").users
  end

  def update
    if params[:course] && @course.update_attributes(course_params)
      flash[:success] = flash_message "updated"
    else
      flash[:danger] = flash_message "not updated"
    end
    redirect_to admin_course_path @course
  end

  private
  def course_params
    params.require(:course).permit Course::ATTRIBUTES_PARAMS
  end
end
