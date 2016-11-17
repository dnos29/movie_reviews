class UserGroup < ApplicationRecord
  has_many :users
  has_many :permissions
  has_many :roles, through: :permissions
end
