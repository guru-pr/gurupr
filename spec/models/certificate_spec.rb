require 'rails_helper'

RSpec.describe Certificate, type: :model do
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:event) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:event) }

  it { is_expected.to delegate_method(:name).to(:event).with_prefix }
  it { is_expected.to delegate_method(:local).to(:event).with_prefix }
  it { is_expected.to delegate_method(:occurred_at).to(:event).with_prefix }
  it { is_expected.to delegate_method(:organizer).to(:event).with_prefix }
  it { is_expected.to delegate_method(:duration).to(:event).with_prefix }

  it { is_expected.to delegate_method(:name).to(:user).with_prefix(:participant) }
end
