class Event < ApplicationRecord
  mount_uploader :thumbnail, ImageUploader
  has_many :event_artists
  has_many :artists, through: :event_artists
  has_many :item_events

  scope :default_order, -> {
    where(delete_flg: false).order(date: :desc)
  }

  def items
    Item.where(id: item_events.map(&:item_id))
  end
end
