require 'securerandom'

class Mypage::EventsController < ApplicationController
  before_action :artist_check_sessions

  def index
    @events = Live.default_order
  end

  def new
  end

  def edit
    @event = Live.find_by(id: params[:id])
  end

  def update
    live = Live.find_by(id: params[:id])
    live.update(event_params)
    redirect_to mypage_event_path(id: live.id) and return
  end

  def create
    live = Live.new(event_params)
    live.code = SecureRandom.alphanumeric
    if live.valid?
      live.save
      live.live_artists.create(
        artist_id: current_artist.id
      )
      redirect_to mypage_events_path and return
    else
      render :new
    end
  end

  def show
    @event = Live.find_by(id: params[:id])
    @is_join = @event.artists.include?(current_artist)
  end

  def join_event
    live = Live.find_by(id: params[:event_id])
    # もし現在イベントに参加していなかったら、ログイン中のアーティストを参加させる
    unless live.artists.include?(current_artist)
      live.live_artists.create(
        artist_id: current_artist.id
      )
    end
    redirect_to mypage_event_path(id: live.id) and return
  end

  def left_event
    live = Live.find_by(id: params[:event_id])
    # もし現在イベントに参加していたら、ログイン中のアーティストを削除する
    if live.artists.include?(current_artist)
      live.live_artists.find_by(
        artist_id: current_artist.id
      ).destroy
    end
    redirect_to mypage_event_path(id: live.id) and return
  end

  private

  def event_params
    params.permit(
      :title, :description, :thumbnail, :date, :venue, :website_url
    )
  end
end
