module Admin
  class EventsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_event, only: [:edit, :update, :destroy]

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

    def edit
      respond_to do |format|
        format.html
      end
    end

    def update
      respond_to do |format|
        if @event.update(event_params)
          format.html { redirect_to admin_events_path }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @event.destroy
      respond_to do |format|
        format.html { redirect_to admin_events_path }
      end
    end

    private

    def set_event
      @event = Event.friendly.find(params[:id])
    end

    def event_params
      params.require(:event)
            .permit(:name, :local, :address, :occurred_at, :summary, :duration,
                    :description, :organizer, :certificate_cover)
    end
  end
end
