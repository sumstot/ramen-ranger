class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :name
      t.float :averagez_score
      t.integer :year_opened

      t.timestamps
    end
  end
end
