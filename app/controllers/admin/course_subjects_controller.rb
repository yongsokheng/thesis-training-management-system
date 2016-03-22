class Admin::CourseSubjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @course = Course.find params[:course_id]
    @course_subjects = @course.course_subjects
  end
end
