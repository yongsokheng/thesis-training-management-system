class Note < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :user
  belongs_to :author, class_name: User.name

  validates :name, presence: true

  ATTRIBUTES_PARAMS = [:name, :evaluation_id, :user_id]

  scope :load_notes, ->user_id, author_id{
    where user_id: user_id, author_id: author_id
  }
end
