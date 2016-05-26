module StatisticData
  def statistic_information
    @user_subjects.each do |user_subject|
      statistic_total_tasks user_subject
      statistic_task_perday user_subject
    end
  end

  private
  def statistic_total_tasks user_subject
    tasks_temp = []
    UserTask.statuses.keys.each do |key|
      tasks_temp << user_subject.user_tasks.select do |user_task|
        user_task.status == key
      end.size
    end

    instance_variable_set "@number_tasks_user_#{user_subject.id}", tasks_temp
  end

  def get_end_date_to_statistic user_subject
    if user_subject.end_date && user_subject.end_date < Date.today
      user_subject.end_date
    else
      Date.today
    end
  end

  def statistic_task_perday user_subject
    end_date = get_end_date_to_statistic user_subject

    task_finish_perday = {}
    task_do_perday = {}

    report_dates = user_subject.user.reports.date_round(user_subject.start_date,
      end_date).map &:report_date

    report_dates.each do |date|
      user_subject.user_tasks.each do |user_task|
        task_finish_perday[date.strftime I18n.t("date.formats.default")] = user_task
          .user_task_histories.finished_in_day(date).size

        task_do_perday[date] = user_subject.user.reports.find do |r|
          r.report_date == date
        end.report_details.size
      end
    end

    instance_variable_set "@task_finish_perday_#{user_subject.id}", task_finish_perday
    instance_variable_set "@task_do_perday_#{user_subject.id}", task_do_perday
  end
end
