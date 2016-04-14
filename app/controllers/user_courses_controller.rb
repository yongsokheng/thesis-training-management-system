class UserCoursesController < ApplicationController
  load_and_authorize_resource

  def show
    @course = @user_course.course
    @users = @course.users
    @user_subjects = @user_course.user_subjects.sort_by_course_subject
    @trainers = @course.users.trainers
    @trainees = @course.users.trainees
    @number_of_user_subjects = @user_subjects.count
    @number_of_user_subjects_new = @user_subjects.init.count
    @number__of_user_subjects_progress = @user_subjects.progress.count 
    @number_of_user_subjects_finish = @user_subjects.finish.count
  end
end
