class Rank < ActiveRecord::Base
  belongs_to :evaluation
  ATTRIBUTES_PARAMS = [:begin_point, :end_point, :rank_value]

  validates :begin_point, presence: true
  validates :end_point, presence: true
  validates :rank_value, presence: true
end
