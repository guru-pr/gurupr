require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:slug) }
  it { is_expected.to validate_uniqueness_of(:slug) }
  it { is_expected.to validate_presence_of(:occurred_at) }
  it { is_expected.to validate_presence_of(:local) }
  it { is_expected.to validate_presence_of(:address) }

  it { expect(described_class.respond_to?(:friendly)).to eq true }

  context '.not_happened' do
    let!(:happened)     { create(:event_happened) }
    let!(:not_happened) { create(:event_not_happened) }

    it 'only one event' do
      expect(Event.not_happened.count).to eq 1
    end

    it 'dont include happened events' do
      expect(Event.not_happened).to_not include(happened)
    end

    it 'include not happened events' do
      expect(Event.not_happened).to include(not_happened)
    end
  end
end
