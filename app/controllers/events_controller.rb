class EventsController < ApplicationController
  def index
    @event = Event.find_by(id: params[:event_id])
  end
end
