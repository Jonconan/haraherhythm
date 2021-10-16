class EventArtist < ApplicationRecord
  belongs_to :event
  belongs_to :artist

  scope :artists_join_events, -> (artist_ids) {
    where(artist_id: artist_ids).map(&:event_id)
  }
end
