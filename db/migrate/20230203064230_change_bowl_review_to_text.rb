class ChangeBowlReviewToText < ActiveRecord::Migration[7.0]
  def change
    change_column :bowls, :review, :text
  end
end
