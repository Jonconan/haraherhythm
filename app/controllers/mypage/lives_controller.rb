require 'securerandom'

class Mypage::LivesController < ApplicationController
  before_action :artist_check_sessions

  def index
    @lives = Live.all.order(date: :desc)
  end

  def new
  end

  def create
    live = Live.new(live_params)
    live.code = SecureRandom.alphanumeric
    if live.valid?
      live.save
      redirect_to mypage_lives_path and return
    else
      render :new
    end
  end

  private

  def live_params
    params.permit(
      :title, :description, :date, :venue, :website_url
    )
  end
end
