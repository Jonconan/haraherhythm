require 'securerandom'

class Mypage::ItemsController < ApplicationController
  before_action :artist_check_sessions

  def index
    @items = current_artist.items
  end

  def new
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    live = Item.find_by(id: params[:id])
    live.update(live_params)
    redirect_to mypage_life_path(id: live.id) and return
  end

  def create
    item = current_artist.items.new(item_params)
    item.code = SecureRandom.alphanumeric
    item.sales_format_id = 0
    if item.valid?
      item.save
      redirect_to mypage_items_path and return
    else
      render :new
    end
  end

  def show
    @live = Live.find_by(id: params[:id])
    @is_join = @live.artists.include?(current_artist)
  end

  def join_live
    live = Live.find_by(id: params[:life_id])
    # もし現在ライブに参加していなかったら、ログイン中のアーティストを参加させる
    unless live.artists.include?(current_artist)
      live.live_artists.create(
        artist_id: current_artist.id
      )
    end
    redirect_to mypage_life_path(id: live.id) and return
  end

  def left_live
    live = Live.find_by(id: params[:life_id])
    # もし現在ライブに参加していたら、ログイン中のアーティストを削除する
    if live.artists.include?(current_artist)
      live.live_artists.find_by(
        artist_id: current_artist.id
      ).destroy
    end
    redirect_to mypage_life_path(id: live.id) and return
  end

  private

  def item_params
    params.permit(
      :thumbnail, :name, :price, :delivery_days, :description
    )
  end
end
