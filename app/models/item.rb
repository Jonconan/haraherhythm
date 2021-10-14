class Item < ApplicationRecord
  belongs_to :artist
  mount_uploader :thumbnail, ImageUploader
  belongs_to :sales_format, class_name: 'MasterSalesFormat', foreign_key: :sales_format_id
  has_many :item_life
  has_many :item_tags
  has_many :tags, through: :item_tags
  has_many :item_partners
  has_many :artists, through: :item_partners

  attr_accessor :tags_name, :tag_ids, :sales_format_id, :event_ids

  def events
    Live.where(id: item_life.map(&:live_id))
  end
end
