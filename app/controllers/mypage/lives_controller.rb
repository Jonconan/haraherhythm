require 'securerandom'

class Mypage::LivesController < ApplicationController
  before_action :artist_check_sessions

  def index
    @lives = Live.default_order
  end

  def new
  end

  def create
    live = Live.new(live_params)
    live.code = SecureRandom.alphanumeric
    if live.valid?
      live.save
      live.live_artists.create(
        artist_id: current_artist.id
      )
      redirect_to mypage_lives_path and return
    else
      render :new
    end
  end

  def show
    @live = Live.find_by(id: params[:id])
  end

  private

  def live_params
    params.permit(
      :title, :description, :thumbnail, :date, :venue, :website_url
    )
  end
end
