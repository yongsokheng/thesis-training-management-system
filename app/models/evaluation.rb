class Evaluation < ActiveRecord::Base
  belongs_to :user

  has_one :rank
  has_many :evaluation_details, dependent: :destroy
  has_many :notes, dependent: :destroy
end
