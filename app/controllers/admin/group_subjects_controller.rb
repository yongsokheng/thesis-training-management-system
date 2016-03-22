class Admin::GroupSubjectsController < ApplicationController
  load_and_authorize_resource
  load_and_authorize_resource :course_subject

  before_action :load_data
  before_action :load_user_subjects_not_in_course, only: [:new, :create]
  before_action :load_user_subjects_in_course, only: [:edit, :update]

  def create
    if @group_subject.save
      flash[:success] = flash_message "created"
      redirect_to new_admin_course_subject_group_subject_path(@course_subject)
    else
      flash[:failed] = flash_message "not_created"
      render :new
    end

  end

  def update
    if @group_subject.update_attributes group_subject_params
      flash[:success] = flash_message "updated"
      redirect_to :back
    else
      flash[:failed] = flash_message "not_updated"
      render :edit
    end
  end

  private

  def load_data
    @course = @course_subject.course
  end

  def group_subject_params
    params.require(:group_subject).permit :name, user_subject_ids: []
  end

  def load_user_subjects_not_in_course
    @user_subjects = @course_subject.user_subjects.not_in_group
  end

  def load_user_subjects_in_course
    @user_subjects = @course_subject.user_subjects
  end
end
