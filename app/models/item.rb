class Item < ApplicationRecord
  belongs_to :artist
  mount_uploader :thumbnail, ImageUploader
  belongs_to :sales_format, class_name: 'MasterSalesFormat', foreign_key: :sales_format_id
  has_many :item_tags
  has_many :tags, through: :item_tags
  has_many :item_partners
  has_many :artists, through: :item_partners
  has_many :item_events
  has_many :events, through: :item_events

  attr_accessor :tags_name, :tag_ids, :event_ids

  scope :search_item_ids, -> (item_ids) {
    where(id: item_ids)
  }
end
