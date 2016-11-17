class AddCtrlToUserRoles < ActiveRecord::Migration[5.0]
  def change
    add_column :user_roles, :ctrl, :string
  end
end
