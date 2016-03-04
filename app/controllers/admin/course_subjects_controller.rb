class Admin::CourseSubjectsController < ApplicationController
  load_and_authorize_resource :course_subject
  def update
    if @course_subject.init?
      @course_subject.start_subject
      flash[:success] = flash_message "updated"
    else
      flash[:failed] = flash_message "not updated"
    end
    redirect_to :back
  end
end
