class WelcomeController < ApplicationController
  def index
    # TODO: Many '@', improvement is need
    @members    = User.order(:name)
    not_happened_event = Event.not_happened.first
    unless not_happened_event.nil?
      @next_event = EventDecorator.new(not_happened_event, view_context)
    end
  end
end
