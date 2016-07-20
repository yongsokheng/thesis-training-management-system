class ProgrammingLanguage < ApplicationRecord
  has_many :profiles
  has_many :courses

  validates :name, presence: true

  ATTRIBUTES_PARAMS = [:name]
end
