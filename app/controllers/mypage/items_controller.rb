require 'securerandom'

class Mypage::ItemsController < ApplicationController
  before_action :artist_check_sessions

  def index
    @items = current_artist.items
  end

  def new
    @master_sales_formats = MasterSalesFormat.all
  end

  def edit
    @item = current_artist.items.find_by(id: params[:id])
    @partner_ids = @item.item_partners.map(&:artist_id)
    @artists = Artist.where.not(id: @item.artist.id)
    @master_sales_formats = MasterSalesFormat.all
    @lives = Live.order(date: :desc)
    @events = @item.item_life.map(&:live_id)
  end

  def update
    item = current_artist.items.find_by(id: params[:id])
    item.update(item_params)
    item.item_partners.delete_all if item.item_partners.present?
    params[:partner_ids].each do |partner_id|
      item.item_partners.create(
        artist_id: partner_id
      )
    end
    item.item_life.delete_all if item.item_life.present?
    params[:event_ids].each do |event_id|
      item.item_life.create(
        live_id: event_id
      )
    end
    redirect_to mypage_item_path(id: item.id) and return
  end

  def create
    item = current_artist.items.new(item_params)
    item.code = SecureRandom.alphanumeric
    if item.valid?
      item.save
      redirect_to mypage_items_path and return
    else
      render :new
    end
  end

  def show
    @item = current_artist.items.find_by(id: params[:id])
  end

  private

  def item_params
    params.permit(
      :thumbnail, :name, :price, :delivery_days, :description, :sales_format_id, :event_ids
    )
  end
end
