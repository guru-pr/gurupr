class WelcomeController < ApplicationController
  def index
    # TODO: Many '@', improvement is need
    @members = User.order(:name)
    next_event = Event.not_happened.first

    @next_event = EventDecorator.new(next_event, view_context) if next_event
  end
end
