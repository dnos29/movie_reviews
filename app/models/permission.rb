class Permission < ApplicationRecord
  belongs_to :user_group
  belongs_to :role
end
