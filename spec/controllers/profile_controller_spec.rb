require 'rails_helper'

RSpec.describe ProfileController, type: :controller do
  render_views

  describe 'GET #show' do
    context 'logged in' do
      let(:user) { create(:user) }

      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'needs to be success' do
        get :show

        expect(response).to be_success
      end
    end

    context 'not logged in' do
      it 'needs to be success' do
        get :show

        expect(response).to redirect_to(:root)
      end
    end
  end
end
