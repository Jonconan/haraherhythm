class Live < ApplicationRecord
  mount_uploader :thumbnail, ImageUploader
  has_many :live_artists
  has_many :artists, through: :live_artists

  scope :default_order, -> {
    where(delete_flg: false).order(date: :desc)
  }
end
