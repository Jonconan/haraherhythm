class Item < ApplicationRecord
  belongs_to :artist
  mount_uploader :thumbnail, ImageUploader
end
