module Admin
  class EventsController < ApplicationController
    before_action :authenticate_admin!

    def index
      @events = Event.order(occurred_at: :asc)
    end
  end
end
