class AddCityAndPrefectureToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :city, :string
    add_column :restaurants, :prefecture, :string
  end
end
