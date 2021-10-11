class Live < ApplicationRecord
  has_one_attached :thumbnail
  has_many :live_artists
  has_many :artists, through: :live_artists

  scope :default_order, -> {
    where(delete_flg: false).order(date: :desc)
  }
end
