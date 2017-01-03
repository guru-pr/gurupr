class EventDecorator < DelegateClass(Event)
  delegate :fa_icon, :link_to, :image_tag, :t, :l, :event_url, :concat,
           to: :@view_context

  def initialize(obj, view_context)
    super obj

    @view_context = view_context
  end

  def occurred_at
    fa_icon 'calendar',
            text: l(__getobj__.occurred_at, format: '%a %d/%m/%Y %H:%M')
  end

  def local_link
    address_map do
      concat(fa_icon('map-marker', text: local))
    end
  end

  def local_map_link
    address_map do
      image_tag('https://maps.googleapis.com/maps/api/staticmap?' \
                "center=#{address}&zoom=15&size=300x300&markers=" \
                "color:0xCC342D|#{address}", class: 'map')
    end
  end

  def summary
    render_markdown __getobj__.summary
  end

  def description
    render_markdown __getobj__.description
  end

  def details_link
    link_to t('events.banner.more_details'), self, class: 'btn-more-details'
  end

  def calendar_properties
    @calendar_properties ||= OpenStruct.new(
      date_start:  __getobj__.occurred_at,
      # TODO: Create new field for this?
      date_end:    __getobj__.occurred_at + 2.hours,
      timezone:    Rails.configuration.time_zone,
      title:       name,
      description: __getobj__.description, # TODO: Convert to plain text
      location:    address
    )
  end

  def share_buttons
    url = event_url(self)

    {
      'facebook'    => "http://www.facebook.com/sharer/sharer.php?u=#{url}",
      'twitter'     => "http://twitter.com/share?url=#{url}&text=#{name}",
      'google-plus' => "https://plus.google.com/share?url=#{url}",
      'envelope'    => "mailto:?subject=#{name}&body=#{url}"
    }
  end

  def renderer
    @renderer ||=
      Redcarpet::Markdown.new(Redcarpet::Render::HTML, strikethrough: true)
  end

  def render_markdown(markdown)
    return nil if markdown.blank?

    renderer.render(markdown).html_safe
  end

  private

  def address_map(&block)
    return unless block_given?

    link_to "https://www.google.com.br/maps/search/#{address}",
            target: '_blank', &block
  end
end
