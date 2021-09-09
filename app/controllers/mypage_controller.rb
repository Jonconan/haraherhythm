class MypageController < ApplicationController
  def index
  end

  def edit
    @artist = current_artist
  end

  def update
    render json: artist_params and return
  end

  protected

  def artist_params
    params.require(:artist).permit(
      :email, :name, :nickname,
      :birthday, :postal_code, :address_1, :address_2, :address_3,
      :website_url, :description
    )
  end
end
