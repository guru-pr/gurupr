require 'rails_helper'

RSpec.describe EventDecorator, type: :decorator do
  let!(:event) { create(:event, occurred_at: Time.zone.parse('1977-03-14 14:15:16')) }
  subject { described_class.new(event) }

  it { expect(subject.persisted?).to     eq(event.persisted?) }
  it { expect(subject.name).to           eq('event') }
  it { expect(subject.slug).to           eq('event') }
  it { expect(subject.occurred_at).to    eq("<i class=\"fa fa-calendar\"></i> Seg 14/03/1977 14:15") }
  it { expect(subject.local_link).to     eq("<a target=\"_blank\" href=\"https://www.google.com.br/maps/search/address\"><i class=\"fa fa-map-marker\"></i> local</a>") }
  it { expect(subject.local_map_link).to eq("<a target=\"_blank\" href=\"https://www.google.com.br/maps/search/address\"><img class=\"img-responsive pull-right\" src=\"https://maps.googleapis.com/maps/api/staticmap?center=address&amp;zoom=15&amp;size=300x300&amp;markers=color:0xCC342D|address\" alt=\"Staticmap?center=address&amp;zoom=15&amp;size=300x300&amp;markers=color:0xcc342d|address\" /></a>") }
  it { expect(subject.summary).to        eq("<p>summary</p>\n") }
  it { expect(subject.description).to    eq("<p>description</p>\n") }
  it { expect(subject.details_link).to   eq("<a class=\"btn-more-details\" href=\"/events/event\">Maiores informações</a>") }
end
