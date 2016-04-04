class Admin::ProfilesController < ApplicationController
  load_and_authorize_resource
  before_action :load_data_profile, only: :edit

  def edit
  end

  def update
    if @profile.update_attributes profile_params
      flash[:success] = flash_message "updated"
      redirect_to admin_profiles_path
    else
      flash[:failed] = flash_message "not_updated"
      load_data_profile
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit Profile::ATTRIBUTES_PARAMS
  end

  def load_data_profile
    @universities = University.all
    @programming_languages = ProgrammingLanguage.all
    @statuses = Status.all
    @user_progresses = UserProgress.all
    @user_types = UserType.all
    @trainers = User.trainers
  end
end
