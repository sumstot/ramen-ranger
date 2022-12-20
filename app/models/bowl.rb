class Bowl < ApplicationRecord
  belongs_to :restaurant
  has_many :images
end
