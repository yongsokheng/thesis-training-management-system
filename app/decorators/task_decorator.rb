class TaskDecorator < Draper::Decorator
  delegate_all

  def get_name
    name || TaskMaster.find(task_master_id).name
  end

  def get_description
    description || TaskMaster.find(task_master_id).description
  end
end
