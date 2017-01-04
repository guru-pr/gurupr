require 'rails_helper'

RSpec.describe EventDecorator, type: :decorator do
  let!(:event) do
    create(:event, occurred_at: Time.zone.parse('1977-03-14 14:15:16'))
  end

  let(:address_link) do
    "https://www.google.com.br/maps/search/#{event.address}"
  end

  let(:view_context) do
    instance_double(ApplicationController.new.view_context.class,
                    fa_icon: nil,
                    link_to: nil,
                    image_tag: nil,
                    t: nil,
                    l: nil,
                    event_url: nil,
                    concat: nil)
  end

  subject { described_class.new(event, view_context) }

  it { expect(subject.persisted?).to     eq(event.persisted?) }
  it { expect(subject.name).to           eq('event') }
  it { expect(subject.slug).to           eq('event') }
  it { expect(subject.summary).to        eq("<p>summary</p>\n") }
  it { expect(subject.description).to    eq("<p>description</p>\n") }

  describe '#occurred_at' do
    it 'calls fa_icon with correct arguments' do
      l_response = anything

      expect(view_context).to receive(:l)
        .with(event.occurred_at, format: '%a %d/%m/%Y %H:%M') { l_response }
      expect(view_context).to receive(:fa_icon)
        .with('calendar', text: l_response)

      subject.occurred_at
    end
  end

  describe '#local_link' do
    it 'calls link_to with correct arguments' do
      fa_response = anything
      expect(view_context).to receive(:link_to)
        .with(address_link, target: '_blank').and_yield
      expect(view_context).to receive(:fa_icon)
        .with('map-marker', text: event.local) { fa_response }
      expect(view_context).to receive(:concat)
        .with(fa_response)

      subject.local_link
    end
  end

  describe '#local_map_link' do
    it 'calls link_to with correct arguments' do
      image_link = 'https://maps.googleapis.com/maps/api/staticmap?' \
                   "center=#{event.address}&zoom=15&size=300x300" \
                   "&markers=color:0xCC342D|#{event.address}"

      expect(view_context).to receive(:link_to)
        .with(address_link, target: '_blank').and_yield
      expect(view_context).to receive(:image_tag)
        .with(image_link, class: 'map')

      subject.local_map_link
    end
  end

  describe '#details_link' do
    it 'calls link_to with the correct arguments' do
      t_response = anything
      expect(view_context).to receive(:t)
        .with('events.banner.more_details') { t_response }
      expect(view_context).to receive(:link_to)
        .with(t_response, subject, class: 'btn-more-details')
      subject.details_link
    end
  end

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

    before do
      allow(view_context).to receive(:event_url) { url }
    end

    it 'button to share on facebook ' do
      link = "http://www.facebook.com/sharer/sharer.php?u=#{url}"

      expect(share_buttons.keys).to include 'facebook'
      expect(share_buttons['facebook']).to eq link
    end

    it 'button to share on twitter' do
      link = "http://twitter.com/share?url=#{url}&text=#{event.name}"

      expect(share_buttons.keys).to include 'twitter'
      expect(share_buttons['twitter']).to eq link
    end

    it 'button to share on google plus' do
      link = "https://plus.google.com/share?url=#{url}"

      expect(share_buttons.keys).to include 'google-plus'
      expect(share_buttons['google-plus']).to eq link
    end

    it 'button to share via email' do
      link = "mailto:?subject=#{event.name}&body=#{url}"

      expect(share_buttons.keys).to include 'envelope'
      expect(share_buttons['envelope']).to eq link
    end
  end

  context '#renderer' do
    it { expect(subject.renderer).to be_an_instance_of(Redcarpet::Markdown) }
  end

  context '#render_markdown' do
    context 'with empty value to render' do
      before { expect(subject.renderer).not_to receive(:render) }

      it { expect(subject.render_markdown(nil)).to be_nil }
      it { expect(subject.render_markdown('')).to  be_nil }
    end

    context 'with value to render' do
      before(:each) do
        expect(subject.renderer).to receive(:render)
          .once.with('markdown').and_return('html')
      end

      it { expect(subject.render_markdown('markdown')).to eq('html') }
      it { expect(subject.render_markdown('markdown').html_safe?).to be(true) }
    end
  end
end
