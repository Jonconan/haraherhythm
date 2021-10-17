class ItemPartner < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :artist

  scope :artists_join_items, -> (artist_ids) {
    where(artist_id: artist_ids).map(&:item_id)
  }
end
