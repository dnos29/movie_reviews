class AddCtrlToRoles < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :ctrl, :string
  end
end
