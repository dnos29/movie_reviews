class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.references :user_group, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
