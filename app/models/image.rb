class Image < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :product, optional: true
  belongs_to :user, optional: true
end
