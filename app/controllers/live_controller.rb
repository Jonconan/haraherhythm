class LiveController < ApplicationController
  def index
    @id = params[:live_id]
  end
end
