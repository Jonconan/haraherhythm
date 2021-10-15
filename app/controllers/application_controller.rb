class ApplicationController < ActionController::Base

  # ログイン中か否かのセッションを確認する
  def artist_check_sessions
    redirect_to new_artist_session_path unless current_artist.present?
  end

  # マイページはアーティストとユーザーとで同じ場所を見ているため、
  # ログイン中か否かの判定を分けなくてはならない
  def mypage_session_check
    redirect_to root_path unless (current_artist.present? || current_user.present?)
  end
end
