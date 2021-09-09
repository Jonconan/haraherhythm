class ArtistsController < ApplicationController
  def index
    @artist = Artist.find_by(id: params[:artist_id])
  end
end
