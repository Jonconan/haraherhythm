class UserArtist < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :artist, optional: true
end
