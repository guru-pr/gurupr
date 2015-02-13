require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:slug) }
  it { is_expected.to validate_uniqueness_of(:slug) }
  it { is_expected.to validate_presence_of(:occurred_at) }
  it { is_expected.to validate_presence_of(:local) }
  it { is_expected.to validate_presence_of(:address) }

  it { expect(described_class.respond_to?(:friendly)).to eq true }
end
