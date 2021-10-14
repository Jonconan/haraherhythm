require 'securerandom'

class Mypage::ItemsController < ApplicationController
  before_action :artist_check_sessions

  def index
    @items = current_artist.items
  end

  def new
    @master_sales_formats = MasterSalesFormat.all
    @artists = Artist.where.not(id: current_artist.id)
    @events = Event.order(date: :desc)
    @tags = Tag.all
  end

  def edit
    @item = current_artist.items.find_by(id: params[:id])
    @artists = Artist.where.not(id: @item.artist.id)
    @master_sales_formats = MasterSalesFormat.all
    @all_events = Event.order(date: :desc)
    @events = @item.item_events.map(&:event_id)
    @tags = Tag.all
  end

  def update
    item = current_artist.items.find_by(id: params[:id])
    item.update(item_params)
    item.item_partners.delete_all if item.item_partners.present?
    params[:partner_ids]&.each do |partner_id|
      item.item_partners.create(
        artist_id: partner_id
      )
    end
    item.item_events.delete_all if item.item_events.present?
    params[:event_ids]&.each do |event_id|
      item.item_events.create(
        event_id: event_id
      )
    end

    item.item_tags.delete_all if item.item_tags.present?
    params[:tag_ids]&.each do |tag_id|
      item.item_tags.create(
        tag_id: tag_id
      )
    end
    if params[:tags_name].present?
      params[:tags_name].split().each do |tag_name|
        tag = Tag.find_by(name: tag_name)
        tag = Tag.create(name: tag_name) unless tag.present?
        item.item_tags.create(
          tag_id: tag.id
        )
      end
    end
    redirect_to mypage_item_path(id: item.id) and return
  end

  def create
    item = current_artist.items.new(item_params)
    item.code = SecureRandom.alphanumeric
    if item.valid?
      item.save
      params[:partner_ids]&.each do |partner_id|
        item.item_partners.create(
          artist_id: partner_id
        )
      end
      params[:event_ids]&.each do |event_id|
        item.item_events.create(
          event_id: event_id
        )
      end

      params[:tag_ids]&.each do |tag_id|
        item.item_tags.create(
          tag_id: tag_id
        )
      end
      if params[:tags_name].present?
        params[:tags_name].split().each do |tag_name|
          tag = Tag.find_by(name: tag_name)
          tag = Tag.create(name: tag_name) unless tag.present?
          item.item_tags.create(
            tag_id: tag.id
          )
        end
      end
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
      :thumbnail, :name, :price, :delivery_days, :description,
      :tags_name, :tag_ids, :sales_format_id, :event_ids
    )
  end
end
