class EventDecorator < ApplicationDecorator
  include Draper::LazyHelpers

  delegate :name, :slug, :persisted?

  def occurred_at
    fa_icon 'calendar', text: l(object.occurred_at, format: '%a %d/%m/%Y %H:%M')
  end

  def local_link
    link_to "https://www.google.com.br/maps/search/#{object.address}", target: '_blank' do
      concat(fa_icon 'map-marker', text: object.local)
    end
  end

  def local_map_link
    link_to "https://www.google.com.br/maps/search/#{object.address}", target: '_blank' do
      image_tag("https://maps.googleapis.com/maps/api/staticmap?center=#{object.address}&zoom=15&size=300x300&markers=color:0xCC342D|#{object.address}", class: 'map')
    end
  end

  def summary
    render_markdown object.summary
  end

  def description
    render_markdown object.description
  end

  def details_link
    link_to t('events.banner.more_details'), object, class: 'btn-more-details'
  end

  def calendar_properties
    @calendar_properties ||= OpenStruct.new(
      date_start:  object.occurred_at,
      date_end:    object.occurred_at + 2.hours, # TODO: Create new field for this?
      timezone:    Rails.configuration.time_zone,
      title:       object.name,
      description: object.description, # TODO: Convert to plain text
      location:    object.address
    )
  end
end
