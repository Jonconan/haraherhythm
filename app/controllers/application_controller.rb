class ApplicationController < ActionController::Base

  # ログイン中か否かのセッションを確認する
  def artist_check_sessions
    redirect_to new_artist_session_path unless current_artist.present?
  end
end
