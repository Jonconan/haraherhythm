class ArtistsController < ApplicationController
  def index
    @artist = Artist.find_by(id: params[:artist_id])
    @is_following = false
    @is_following = true if current_user.present? and @artist.followed?(user: current_user)
  end

  ## アーティストをフォローする
  def follow
    artist = Artist.find_by(id: params[:artist_id])
    # もしアーティストがいなかったらトップへ飛ばす（不正リクエスト）
    redirect_to root_path unless artist.present?
    # ユーザーでログインしていない状態だったら何もせず戻す
    redirect_to artist_path(artist_id: artist.id) unless current_user.present?
    # このアーティストをフォローする
    current_user.user_artists.create(artist_id: artist.id)
    redirect_to artist_path(artist_id: artist.id)
  end

  ## アーティストのフォローを解除する
  def unfollow
    artist = Artist.find_by(id: params[:artist_id])
    # もしアーティストがいなかったらトップへ飛ばす（不正リクエスト）
    redirect_to root_path unless artist.present?
    # ユーザーでログインしていない状態だったら何もせず戻す
    redirect_to artist_path(artist_id: artist.id) unless current_user.present?
    # このアーティストのフォローを解除する
    current_user.user_artists.where(artist_id: artist.id).delete_all
    redirect_to artist_path(artist_id: artist.id)
  end
end
