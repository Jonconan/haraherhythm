class User < ApplicationRecord
  mount_uploader :thumbnail, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_artists, -> { order(id: :desc) }
  has_many :artists, through: :user_artists

  def follow_artists_events
    event_ids = EventArtist.artists_join_events(artists.ids)
    Event.search_event_ids(event_ids).limit(3)
  end

  def follow_artists_items
    item_ids = ItemPartner.artists_join_items(artists.ids)
    item_ids.push(Item.where(artist_id: artists.ids).ids)
    Item.where(id: item_ids.flatten.uniq).limit(3)
  end
end
