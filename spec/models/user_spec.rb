require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:provider) }
  it { is_expected.to validate_inclusion_of(:provider).in_array(%w(github)) }
  it { is_expected.to validate_presence_of(:uid) }
  it { is_expected.to validate_uniqueness_of(:uid).scoped_to(:provider) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:nickname) }
  it { is_expected.to validate_presence_of(:image) }

  context '.find_or_create_with_omniauth' do
    let(:info) { OpenStruct.new(email: 'email@user.com', name: 'Email User', nickname: 'nickname-user', image: 'http://placehold.it/300') }
    let(:auth) { OpenStruct.new(uid: '1', info: info, provider: 'github') }

    it 'inexistent user' do
      expect { User.find_or_create_with_omniauth(auth) }.to change(User, :count).by(1)
    end

    it 'existent user' do
      create(:valid_user)
      expect { User.find_or_create_with_omniauth(auth) }.to change(User, :count).by(0)
    end
  end
end
