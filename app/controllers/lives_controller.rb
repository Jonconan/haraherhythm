class LivesController < ApplicationController
  def index
    @event = Live.find_by(id: params[:life_id])
  end
end
