class EventsController < ApplicationController
  def index
    @events = Event.order(occurred_at: :desc).decorate
  end

  def show
    @event = Event.friendly.find(params[:id]).decorate
    @title = @event.name
  end
end
