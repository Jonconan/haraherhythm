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
    @master_sales_formats = MasterSalesFormat.all
  end

  def update
    item = current_artist.items.find_by(id: params[:id])
    item.update(item_params)
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
      :thumbnail, :name, :price, :delivery_days, :description, :sales_format_id
    )
  end
end
