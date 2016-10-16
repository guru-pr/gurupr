require 'rails_helper'

RSpec.describe SessionCreator, :omniauth do
  let(:auth) { auth_mock(user) }

  subject { described_class.new(auth) }

  context 'when user not exist' do
    let(:user) { build(:user) }

    before do
      allow(RestClient).to receive(:post)
    end

    it 'creates user' do
      expect { subject.call }.to change(User, :count).by(1)
    end

    context 'persist attributes' do
      before { subject.call }

      it { expect(subject.user.name).to eq user.name }
      it { expect(subject.user.email).to eq user.email }
      it { expect(subject.user.nickname).to eq user.nickname }
      it { expect(subject.user.image).to eq user.image }
    end

    it 'register email in newsletter' do
      url = 'https://api.sendgrid.com/v3/contactdb/recipients'
      data = [{ email: user.email, first_name: user.name.split.first, last_name: user.name.split.last }].to_json
      opts = { content_type: :json, accept: :json, Authorization: "Bearer #{ENV['SENDGRID_API_KEY']}" }

      expect(RestClient).to receive(:post).with(url, data, opts)

      subject.call
    end
  end

  context 'when user exist' do
    let!(:user) { create(:user) }

    it 'does not create user' do
      expect { subject.call }.to_not change(User, :count)
    end

    context 'persist attributes' do
      before { subject.call }

      it { expect(subject.user.name).to eq user.name }
      it { expect(subject.user.email).to eq user.email }
      it { expect(subject.user.nickname).to eq user.nickname }
      it { expect(subject.user.image).to eq user.image }
    end

    it 'does not register email in newsletter' do
      expect(RestClient).to_not receive(:post)

      subject.call
    end
  end
end
