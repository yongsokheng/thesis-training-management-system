class ProgrammingLanguage < ActiveRecord::Base
  has_many :profiles
  has_many :courses

  validates :name, presence: true

  ATTRIBUTES_PARAMS = [:name]
end
