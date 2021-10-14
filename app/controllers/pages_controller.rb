class PagesController < ApplicationController
  def index
    @artists = Artist.all
    @lives = Live.default_order.limit(6)
    @items = Item.order(created_at: :desc).limit(6)
  end
end
