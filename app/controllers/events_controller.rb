class EventsController < ApplicationController
  def show
    @event = Event.friendly.find(params[:id]).decorate
    @title = @event.name
  end
end
