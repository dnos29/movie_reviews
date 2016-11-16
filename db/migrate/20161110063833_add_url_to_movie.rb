class AddUrlToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :url, :string
  end
end
