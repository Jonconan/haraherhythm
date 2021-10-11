class PagesController < ApplicationController
  def index
    @artists = Artist.all
    @lives = Live.default_order.limit(6)
  end
end
