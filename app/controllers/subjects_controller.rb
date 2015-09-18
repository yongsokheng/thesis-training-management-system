class SubjectsController < ApplicationController
  before_action :load_course, only: :update
  before_action :check_status, only: :update

  def update
    if @user_subject.update_attributes status: true
      flash[:success] = flash_message "updated"
    else
      flash[:danger] = flash_message "not_updated"
    end
    respond_to do |format|
      format.html{redirect_to [@user_course, @user_subject]}
      format.js
    end
  end

  private
  def load_course
    @user_subject = UserSubject.find params[:user_subject_id]
    @user_course = @user_subject.user_course
  end

  def check_status
    redirect_to :back unless params[:status] == Settings.finish
  end
end
