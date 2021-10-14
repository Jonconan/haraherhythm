class EventsController < ApplicationController
  def index
    @event = Live.find_by(id: params[:event_id])
  end
end
