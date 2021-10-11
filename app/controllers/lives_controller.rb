class LivesController < ApplicationController
  def index
    @live = Live.find_by(id: params[:life_id])
  end
end
