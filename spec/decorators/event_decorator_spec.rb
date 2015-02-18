require 'rails_helper'

RSpec.describe EventDecorator, type: :decorator do
  subject { described_class.new(create :event, occurred_at: Time.zone.parse('1977-03-14 14:15:16')) }

  it { expect(subject.name).to         eq('event') }
  it { expect(subject.occurred_at).to  eq("<i class=\"fa fa-calendar\"></i> Seg 14/03/1977 14:15") }
  it { expect(subject.local).to        eq("<a target=\"_blank\" href=\"https://www.google.com.br/maps/search/address\"><i class=\"fa fa-map-marker\"></i> local</a>") }
  it { expect(subject.summary).to      eq("<p>summary</p>\n") }
  it { expect(subject.description).to  eq("<p>description</p>\n") }
  it { expect(subject.details_link).to eq("<a class=\"btn btn-success\" href=\"/events/event\">Maiores informações</a>") }
end
