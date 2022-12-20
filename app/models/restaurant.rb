class Restaurant < ApplicationRecord
  has_many :bowls, dependent: :destroy
end
