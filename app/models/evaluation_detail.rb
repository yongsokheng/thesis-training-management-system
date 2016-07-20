class EvaluationDetail < ApplicationRecord
  belongs_to :evaluation
  belongs_to :evaluation_template
end
