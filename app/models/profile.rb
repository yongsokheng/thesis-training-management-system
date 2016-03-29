class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_type
  belongs_to :university
  belongs_to :programming_language
  belongs_to :progress
  belongs_to :status

  ATTRIBUTES_PARAMS = [
    :start_training_date, :leave_date, :finish_training_date,
    :ready_for_project, :contract_date, :naitei_company, :trainer_id,
    :user_type_id, :university_id, :programming_language_id, :progress_id,
    :status_id
  ]

  delegate :name, :email, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :university, prefix: true, allow_nil: true
  delegate :name, to: :user_type, prefix: true, allow_nil: true
  delegate :name, to: :progress, prefix: true, allow_nil: true
  delegate :name, to: :status, prefix: true, allow_nil: true
  delegate :name, to: :programming_language, prefix: true, allow_nil: true
end
