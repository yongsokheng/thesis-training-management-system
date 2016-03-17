class Role < ActiveRecord::Base
  has_many :users
  has_many :permissions, dependent: :destroy

  accepts_nested_attributes_for :permissions, allow_destroy: true

  ATTRIBUTES_PARAMS = [permissions_attributes: [:id, :model_class, :action, :_destroy]]
end
