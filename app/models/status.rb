class Status < ApplicationRecord
  has_many :profiles

  ATTRIBUTES_PARAMS = [:name]

  validates :name, presence: true
end
