class EvaluationTemplate < ActiveRecord::Base
  has_many :evaluation_details
  ATTRIBUTES_PARAMS = [:name, :min_point, :max_point]
end
