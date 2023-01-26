class RenameAveragezScore < ActiveRecord::Migration[7.0]
  def change
    rename_column :restaurants, :averagez_score, :average_score
  end
end
