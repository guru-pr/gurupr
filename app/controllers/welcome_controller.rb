class WelcomeController < ApplicationController
  def index
    # TODO: Many '@', improvement is need
    @members = User.order(:name)
    event = Event.not_happened.first

    @next_event = EventDecorator.new(event, view_context) if event
  end
end
