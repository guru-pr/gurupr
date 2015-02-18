class EventDecorator < ApplicationDecorator
  include Draper::LazyHelpers

  delegate :name, :slug, :persisted?

  def occurred_at
    fa_icon 'calendar', text: l(object.occurred_at, format: '%a %d/%m/%Y %H:%M')
  end

  def local
    link_to "https://www.google.com.br/maps/search/#{object.address}", target: '_blank' do
      concat(fa_icon 'map-marker', text: object.local)
    end
  end

  def local_map
    link_to "https://www.google.com.br/maps/search/#{object.address}", target: '_blank' do
      image_tag("https://maps.googleapis.com/maps/api/staticmap?center=#{object.address}&zoom=15&size=300x300&markers=color:0xCC342D|#{object.address}", class: 'img-responsive pull-right')
    end
  end

  def summary
    render_markdown object.summary
  end

  def description
    render_markdown object.description
  end

  def details_link
    link_to t('events.banner.more_details'), object, class: 'btn btn-success'
  end
end
