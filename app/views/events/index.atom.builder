atom_feed do |feed|
  feed.title 'GURU-PR'
  feed.updated @events.maximum(:updated_at)

  @events.each do |event|
    feed.entry event do |entry|
      entry.title event.name
      entry.summary render_markdown(event.summary), type: 'html'
      entry.content render_markdown(event.description), type: 'html'
      entry.author do |author|
        author.name 'GURU-PR'
      end
    end
  end
end
