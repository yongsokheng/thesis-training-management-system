class EvaluationDetail < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :evaluation_template
end
