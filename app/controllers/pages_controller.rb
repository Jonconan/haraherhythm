class PagesController < ApplicationController
  def index
    @artists = Artist.all
    @lives = Live.order(date: :desc).limit(6)
  end
end
