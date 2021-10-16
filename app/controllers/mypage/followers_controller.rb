class Mypage::FollowersController < ApplicationController
  before_action :artist_check_sessions

  def index
    @message = 'まだフォローされていません。'
    @message = "現在、#{current_artist.users.count}人にフォローされています。" if current_artist.users.present?
  end
end
