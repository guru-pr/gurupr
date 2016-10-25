class EventsController < ApplicationController
  def index
    @events = Event.order(occurred_at: :desc)
    respond_to do |format|
      format.html { @events = @events.map { |e| e.decorate(view_context) } }
      format.atom { @markdown_renderer = markdown_renderer }
    end
  end

  def show
    @event = Event.friendly.find(params[:id]).decorate(view_context)
    @title = @event.name
  end

  private

  def markdown_renderer
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, strikethrough: true)
  end
end
