class UserTaskService
  def initialize user_task, user_task_params = nil
    @user_task = user_task
    @user_task_params = user_task_params
    check_estimated_time
    check_spent_time
    check_status
  end

  def update
    @successed = UserTaskHistory.transaction do
      begin
        create_history if @spent_time.present? || @estimated_time.present? || @status.present?
        UserTask.transaction(requires_new: true) do
          @user_task.update_attributes! @user_task_params
        end
        true
      rescue
        raise ActiveRecord::Rollback
        false
      end
    end

    unless @successed
      @user_task.errors.add :base, I18n.t("flashs.messages.unknow_errors")
    end

    @successed
  end

  private
  def create_history
    @user_task.user_task_histories.create! spent_time: @spent_time,
      estimated_time: @estimated_time, status: @status
  end

  def check_spent_time
    @spent_time = @user_task_params[:spent_time]
    @user_task_params[:spent_time] = @user_task_params[:spent_time].to_f + @user_task.spent_time.to_f
  end

  def check_estimated_time
    @estimated_time = if @user_task_params[:estimated_time].present? &&
      @user_task_params[:estimated_time].to_f == @user_task.estimated_time
      nil
    else
      @user_task_params[:estimated_time]
    end
  end

  def check_status
    @status = if @user_task_params[:status] == @user_task.status
      nil
    else
      @user_task_params[:status]
    end
  end
end
