class MypageController < ApplicationController
  def index
  end

  def edit
    @artist = current_artist
  end

  def update
    sns_list = %w(twitter facebook instagram youtube)
    current_artist.update(artist_params)
    sns_list.each do |sns|
      if artist_params[sns.to_sym].present?
        current_artist.artist_sns_accounts.create(
          master_sns_service_id: MasterSnsService.sns_service_id(sns),
          account_path: artist_params[sns.to_sym]
        )
      end
    end
    redirect_to mypage_path
  end

  protected

  def artist_params
    params.require(:artist).permit(
      :email, :name, :nickname,
      :birthday, :postal_code, :address_1, :address_2, :address_3,
      :website_url, :description, :thumbnail,
      :twitter, :facebook, :instagram, :youtube
    )
  end
end
