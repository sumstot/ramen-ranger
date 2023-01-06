class CreateFavoriteBowls < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_bowls do |t|

      t.timestamps
    end
  end
end
