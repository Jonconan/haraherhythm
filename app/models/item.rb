class Item < ApplicationRecord
  belongs_to :artist
  mount_uploader :thumbnail, ImageUploader
  belongs_to :sales_format, class_name: 'MasterSalesFormat', foreign_key: :sales_format_id
  has_many :item_partners
  has_many :item_life

  attr_accessor :partner_ids

  def partners
    Artist.where(id: item_partners.map(&:artist_id))
  end

  def events
    Live.where(id: item_life.map(&:live_id))
  end
end
