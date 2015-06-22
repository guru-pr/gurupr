require 'rails_helper'

RSpec.describe EventDecorator, type: :decorator do
  include Draper::ViewHelpers

  let!(:event) { create(:event, occurred_at: Time.zone.parse('1977-03-14 14:15:16')) }
  subject { described_class.new(event) }

  it { expect(subject.persisted?).to     eq(event.persisted?) }
  it { expect(subject.name).to           eq('event') }
  it { expect(subject.slug).to           eq('event') }
  it { expect(subject.occurred_at).to    eq("<i class=\"fa fa-calendar\"></i> Seg 14/03/1977 14:15") }
  it { expect(subject.local_link).to     eq("<a target=\"_blank\" href=\"https://www.google.com.br/maps/search/address\"><i class=\"fa fa-map-marker\"></i> local</a>") }
  it { expect(subject.local_map_link).to eq("<a target=\"_blank\" href=\"https://www.google.com.br/maps/search/address\"><img class=\"map\" src=\"https://maps.googleapis.com/maps/api/staticmap?center=address&amp;zoom=15&amp;size=300x300&amp;markers=color:0xCC342D|address\" alt=\"Staticmap?center=address&amp;zoom=15&amp;size=300x300&amp;markers=color:0xcc342d|address\" /></a>") }
  it { expect(subject.summary).to        eq("<p>summary</p>\n") }
  it { expect(subject.description).to    eq("<p>description</p>\n") }
  it { expect(subject.details_link).to   include "<a class=\"btn-more-details\" href=" }

  describe '#calendar_properties' do
    let(:properties) { subject.calendar_properties }

    it { expect(properties.date_start).to eq event.occurred_at }
    it { expect(properties.date_end).to eq event.occurred_at + 2.hours }
    it { expect(properties.timezone).to eq Rails.configuration.time_zone }
    it { expect(properties.title).to eq event.name }
    it { expect(properties.description).to eq event.description }
    it { expect(properties.location).to eq event.address }
  end

  describe '#share_buttons' do
    let(:share_buttons) { subject.share_buttons }
    let(:url) { "/events/#{event.id}" }

    before { expect(helpers).to receive(:event_url).and_return("/events/#{event.id}") }

    it 'button to share on facebook ' do
      expect(share_buttons.keys).to include 'facebook'
      expect(share_buttons['facebook']).to eq "http://www.facebook.com/sharer/sharer.php?u=#{url}"
    end

    it 'button to share on twitter' do
      expect(share_buttons.keys).to include 'twitter'
      expect(share_buttons['twitter']).to eq "http://twitter.com/share?url=#{url}&text=#{event.name}"
    end

    it 'button to share on google plus' do
      expect(share_buttons.keys).to include 'google-plus'
      expect(share_buttons['google-plus']).to eq "https://plus.google.com/share?url=#{url}"
    end

    it 'button to share via email' do
      expect(share_buttons.keys).to include 'envelope'
      expect(share_buttons['envelope']).to eq "mailto:?subject=#{event.name}&body=#{url}"
    end
  end
end
