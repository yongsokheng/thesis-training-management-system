class Rank < ApplicationRecord
  belongs_to :evaluation
  ATTRIBUTES_PARAMS = [:begin_point, :end_point, :rank_value]

  validates :begin_point, presence: true
  validates :end_point, presence: true
  validates :rank_value, presence: true

  scope :rank_around, ->(total_point){where("begin_point <= ? AND end_point >= ?",
    total_point, total_point)}
end
