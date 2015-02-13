class EventsController < ApplicationController
  def show
    @event = Event.friendly.find(params[:id])
  end
end