class MypageController < ApplicationController
  def index
  end

  def edit
    @artist = current_artist
  end

  def update
    current_artist.update(artist_params)
    redirect_to mypage_path
  end

  protected

  def artist_params
    params.require(:artist).permit(
      :email, :name, :nickname,
      :birthday, :postal_code, :address_1, :address_2, :address_3,
      :website_url, :description, :thumbnail
    )
  end
end
