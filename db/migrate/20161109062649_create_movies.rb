class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :length
      t.string :release_year
      t.string :rating

      t.timestamps
    end
  end
end
