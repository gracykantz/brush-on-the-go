class Product < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :images, dependent: :destroy
  has_many :bookings
  has_many :reviews, dependent: :destroy
  validates :rating, inclusion: { in: 1..5 }
  validates :price, numericality: { greater_than: 0 }, presence: true
  validates :location, presence: true
  # validates :price, presence: true, numericality: true
  validates :description, presence: true
end
