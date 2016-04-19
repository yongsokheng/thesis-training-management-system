class UserCoursesController < ApplicationController
  load_and_authorize_resource

  def show
    @course = @user_course.course
    @users = @course.users
    @course_subjects = @user_course.user_subjects.sort_by_course_subject
    @trainers = @course.users.trainers
    @trainees = @course.users.trainees
  end
end
