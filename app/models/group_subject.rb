class GroupSubject < ApplicationRecord
  has_many :user_subjects
  has_many :users, through: :user_subjects
end
