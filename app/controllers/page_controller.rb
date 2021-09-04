class PageController < ApplicationController
  def index
    render json: "index" and return
  end
end
