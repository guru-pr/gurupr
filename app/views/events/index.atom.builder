atom_feed do |feed|
  feed.title 'GURU-PR'
  feed.updated @events.maximum(:updated_at)

  @events.each do |event|
    feed.entry event do |entry|
      entry.title event.name
      entry.summary @markdown_renderer.render(event.summary).html_safe, type: 'html'
      entry.content @markdown_renderer.render(event.description).html_safe, type: 'html'
      entry.author do |author|
        author.name 'GURU-PR'
      end
    end
  end
end
