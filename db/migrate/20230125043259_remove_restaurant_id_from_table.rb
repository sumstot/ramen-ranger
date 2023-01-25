class RemoveRestaurantIdFromTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :bowls, :restaurant_id, :bigint
  end
end
