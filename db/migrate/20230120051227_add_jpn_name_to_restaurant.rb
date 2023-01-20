class AddJpnNameToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :jpn_name, :string
  end
end
