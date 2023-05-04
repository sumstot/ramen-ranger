class Bowl < ApplicationRecord
  belongs_to :restaurant
  has_many_attached :images

  def self.ransackable_attributes(auth_object = nil)
    ["restaurant_id", "review", "score", "soup", "updated_at"]
  end
end
