class Restaurant < ApplicationRecord
  has_many :bowls, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, uniqueness: true
  validates :jpn_name, uniqueness: true
end
