module MarkdownHelper
  # used in app/views/events/index.atom.builder
  def render_markdown(markdown)
    return nil if markdown.blank?
    markdown_renderer.render_markdown(markdown)
  end

  private

  def markdown_renderer
    @markdown_renderer ||= ApplicationDecorator.new(Object.new)
  end
end
