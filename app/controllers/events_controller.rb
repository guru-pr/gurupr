class EventsController < ApplicationController
  def index
    @events = Event.order(occurred_at: :desc)
    respond_to do |format|
      format.html { @events = decorate_events }
      format.atom { @markdown_renderer = markdown_renderer }
    end
  end

  def show
    @event = EventDecorator.new(Event.friendly.find(params[:id]), view_context)
    @title = @event.name
  end

  private

  def markdown_renderer
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, strikethrough: true)
  end

  def decorate_events
    @events.map { |e| EventDecorator.new(e, view_context) }
  end
end
