module Admin
  class EventsController < ApplicationController
    before_action :authenticate_admin!

    def index
      @events = Event.order(occurred_at: :asc)

      respond_to do |format|
        format.html
      end
    end

    def new
      @event = Event.new

      respond_to do |format|
        format.html
      end
    end

    def create
      @event = Event.new event_params

      respond_to do |format|
        if @event.save
          format.html { redirect_to admin_events_path }
        else
          format.html { render :new }
        end
      end
    end

    private

    def event_params
      params.require(:event).permit(:name, :local, :address, :occurred_at, :description)
    end
  end
end
