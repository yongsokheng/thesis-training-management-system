class Rank < ActiveRecord::Base
  belongs_to :evaluation
  ATTRIBUTES_PARAMS = [:begin_point, :end_point, :rank_value]
end
