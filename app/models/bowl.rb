class Bowl < ApplicationRecord
  belongs_to :restaurant
  has_many_attached :images
end
