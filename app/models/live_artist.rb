class LiveArtist < ApplicationRecord
  belongs_to :live
  belongs_to :artist
end
