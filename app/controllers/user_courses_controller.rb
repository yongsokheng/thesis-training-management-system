class UserCoursesController < ApplicationController
  load_and_authorize_resource

  def show
    @course = @user_course.course
    @users = @course.users
    @user_subjects = @user_course.user_subjects
    @trainers = @users.trainers
    @trainees = @users.trainees
    @trainees_show = @trainees.limit Settings.number_member_show
    @count_member = @users.size - Settings.number_member_show
    @number_of_user_subjects = @user_subjects.count
    @number_of_user_subjects_new = @user_subjects.init.count
    @number__of_user_subjects_progress = @user_subjects.progress.count 
    @number_of_user_subjects_finish = @user_subjects.finish.count
  end
end
