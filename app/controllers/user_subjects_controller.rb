class UserSubjectsController < ApplicationController
  load_and_authorize_resource
  before_action :load_course

  def show
    @user_subject.subject.tasks.each do |task|
      @user_subject.user_tasks.find_or_initialize_by task_id: task.id,
        user_id: current_user.id
    end
  end

  private
  def load_course
    @course = @user_subject.course
  end
end
