class Bowl < ApplicationRecord
  belongs_to :restaurant
  has_many_attached :images
  # include PgSearch::Model
  # pg_search_scope :search_by_soup_and_rating,
  # against: [:soup, :rating],
  # using: {
  #   tsearch: {prefix: true}
  # }
end
