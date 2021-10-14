class Live < ApplicationRecord
  mount_uploader :thumbnail, ImageUploader
  has_many :live_artists
  has_many :artists, through: :live_artists
  has_many :item_life

  scope :default_order, -> {
    where(delete_flg: false).order(date: :desc)
  }

  def items
    Item.where(id: item_life.map(&:item_id))
  end
end
