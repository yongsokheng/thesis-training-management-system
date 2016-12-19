class Admin::CourseSubjectsController < ApplicationController
  load_and_authorize_resource
  before_action :load_course, except: :new

  def index
    @course_subjects = @course.course_subjects
  end

  def edit
    add_breadcrumb_path "courses"
    add_breadcrumb @course_subject.course_name, admin_course_path(@course)
    add_breadcrumb @course_subject.subject_name, admin_course_subject_path(@course,
      @course_subject.subject)
    add_breadcrumb_edit "subjects"
  end

  def update
    if @course_subject.update_attributes course_subject_params
      @course_subject.users.each do |user|
        user_subject = UserSubject.find_by user_id: user.id, course_subject_id: @course_subject.id
        @course_subject.tasks.each do |task|
          UserTask.find_or_create_by(user_subject_id: user_subject.id,
            user_id: user.id, task_id: task.id)
        end
      end

      respond_to do |format|
        format.js do
          render nothing: true
        end
        format.html do
          flash[:success] = flash_message "updated"
          redirect_to admin_course_subject_path @course, @course_subject.subject
        end
      end
    else
      flash[:failed] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if @course_subject.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:failed] = flash_message "not_deleted"
    end
    redirect_to admin_course_path @course
  end

  private
  def course_subject_params
    params.require(:course_subject).permit CourseSubject::ATTRIBUTES_PARAMS
  end

  def load_course
    @course = Course.find params[:course_id]
  end
end
