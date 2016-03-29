class University < ActiveRecord::Base
  has_many :profiles

  ATTRIBUTES_PARAMS = [:name]

  validates :name, presence: true
end
