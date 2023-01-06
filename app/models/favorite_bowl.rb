class FavoriteBowl < ApplicationRecord
  belongs_to :user
  has_many :bowls
end
