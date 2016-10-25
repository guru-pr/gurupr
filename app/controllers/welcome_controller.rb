class WelcomeController < ApplicationController
  def index
    # TODO: Many '@', improvement is need
    @members    = User.order(:name)
    @next_event = Event.not_happened.first.try(:decorate, view_context)
  end
end
