class Product < ApplicationRecord
  has_many :images
  validates :rating, inclusion: { in: 1..5 }
 # geocoded_by :location
 # after_validation :location, if: :will_save_change_to_location?
end
