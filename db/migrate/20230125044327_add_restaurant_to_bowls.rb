class AddRestaurantToBowls < ActiveRecord::Migration[7.0]
  def change
    add_reference :bowls, :restaurant, null: false, foreign_key: true
  end
end
