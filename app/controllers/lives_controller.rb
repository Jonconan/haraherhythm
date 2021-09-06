class LivesController < ApplicationController
  def index
    @id = params[:live_id]
  end
end
