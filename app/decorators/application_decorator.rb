class ApplicationDecorator < Draper::Decorator
  def renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def render_markdown(markdown)
    return nil if markdown.blank?
    renderer.render(markdown).html_safe
  end
end
