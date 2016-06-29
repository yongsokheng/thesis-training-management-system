class Report < ActiveRecord::Base
  ATTRIBUTES_PARAMS = [:report_date, :working_duration, :lines_code,
    user_task_ids: []]

  enum working_duration: [:all_day, :half_day, :home]

  belongs_to :user

  has_many :report_details, dependent: :destroy
  has_many :user_tasks, through: :report_details

  validates :user_id, :report_date,
    :working_duration, presence: true
  validate :need_report_details
  validate :report_date_must_equal_or_less_than_date_now
  validates :lines_code, numericality: {greater_than_or_equal_to: 0}

  delegate :name, to: :user, prefix: true, allow_nil: true

  scope :date_round, ->start_date, end_date do
    where "report_date >= ? AND report_date <= ?", start_date, end_date
  end
  scope :find_by_user, ->user{where(user_id: user).order created_at: :desc}

  def report_name
    "#{I18n.t("reports.admin.report")}#{report_date}"
  end

  private
  def need_report_details
    if self.report_details.blank?
      errors.add :base, I18n.t("reports.errors.need_task")
    end
  end

  def report_date_must_equal_or_less_than_date_now
    if self.report_date > Time.now.to_date
      errors.add :base, I18n.t("reports.errors.date_errors")
    end
  end
end
