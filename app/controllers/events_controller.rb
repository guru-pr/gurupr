class EventsController < ApplicationController
  def index
    @events = Event.order(occurred_at: :desc)
    respond_to do |format|
      format.html { @events = @events.decorate }
      format.atom
    end
  end

  def show
    @event = Event.friendly.find(params[:id]).decorate
    @title = @event.name
  end
end
