class UserType < ApplicationRecord
  has_many :profiles

  validates :name, presence: true

  ATTRIBUTES_PARAMS = [:name]
end
