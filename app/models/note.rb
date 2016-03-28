class Note < ActiveRecord::Base
  belongs_to :evaluation
  validates :name, presence: true

  ATTRIBUTES_PARAMS = [:name, :evaluation_id]
end
