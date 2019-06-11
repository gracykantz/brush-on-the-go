class Image < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user, optional: true
  mount_uploader :photo, PhotoUploader
end
