class AddPriceToBowl < ActiveRecord::Migration[7.0]
  def change
    add_column :bowls, :price, :bigint
  end
end
