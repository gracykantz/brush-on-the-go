class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :images, dependent: :destroy
  has_many :bookings
  has_many :reviews, dependent: :destroy
  # Rating addition for Product Creation - Shalini
  validates :rating, inclusion: { in: 1..5 }
  # End of Addition
  validates :price, numericality: { greater_than: 0 }, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :location, presence: true
  # validates :price, presence: true, numericality: true
  validates :description, presence: true
end
