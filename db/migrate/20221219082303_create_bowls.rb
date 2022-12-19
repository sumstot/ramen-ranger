class CreateBowls < ActiveRecord::Migration[7.0]
  def change
    create_table :bowls do |t|
      t.string :soup
      t.float :score
      t.string :description
      t.string :review
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
