class EvaluationTemplate < ActiveRecord::Base
  has_many :evaluation_details
  ATTRIBUTES_PARAMS = [:name, :min_point, :max_point]

  validates :name, presence: true
  validates :min_point, presence: true
  validates :max_point, presence: true
end
