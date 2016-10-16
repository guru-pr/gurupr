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

  it { is_expected.to have_many(:certificates) }

  context 'scopes' do
    let!(:normal) { create(:user) }
    let!(:admin)  { create(:user_admin) }

    context '.admin' do

      it 'only one user' do
        expect(User.admin.count).to eq 1
      end

      it 'dont include normal users' do
        expect(User.admin).to_not include(normal)
      end

      it 'include admin users' do
        expect(User.admin).to include(admin)
      end
    end

    context '.normal' do
      it 'only one user' do
        expect(User.normal.count).to eq 1
      end

      it 'dont include admin users' do
        expect(User.normal).to_not include(admin)
      end

      it 'include normal users' do
        expect(User.normal).to include(normal)
      end
    end
  end
end
