require 'securerandom'

class Mypage::EventsController < ApplicationController
  before_action :artist_check_sessions

  def index
    @events = Event.default_order
  end

  def new
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    event = Event.find_by(id: params[:id])
    event.update(event_params)
    redirect_to mypage_event_path(id: event.id) and return
  end

  def create
    event = Event.new(event_params)
    event.code = SecureRandom.alphanumeric
    if event.valid?
      event.save
      event.event_artists.create(
        artist_id: current_artist.id
      )
      redirect_to mypage_events_path and return
    else
      render :new
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @is_join = @event.artists.include?(current_artist)
  end

  def join_event
    event = Event.find_by(id: params[:event_id])
    # もし現在イベントに参加していなかったら、ログイン中のアーティストを参加させる
    unless event.artists.include?(current_artist)
      event.event_artists.create(
        artist_id: current_artist.id
      )
    end
    redirect_to mypage_event_path(id: event.id) and return
  end

  def left_event
    event = Event.find_by(id: params[:event_id])
    # もし現在イベントに参加していたら、ログイン中のアーティストを削除する
    if event.artists.include?(current_artist)
      event.event_artists.find_by(
        artist_id: current_artist.id
      ).destroy
    end
    redirect_to mypage_event_path(id: event.id) and return
  end

  private

  def event_params
    params.permit(
      :title, :description, :thumbnail, :date, :venue, :website_url
    )
  end
end
