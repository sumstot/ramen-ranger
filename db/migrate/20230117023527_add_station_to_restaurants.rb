class AddStationToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :station, :string
  end
end
