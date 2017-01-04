require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  render_views

  let!(:user) { create(:user, name: 'My Name') }

  describe 'GET #show' do
    context 'logged in' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'needs to be success' do
        get :show

        expect(response).to be_success
      end

      it 'assigns user as current_user' do
        expect(controller).to receive(:current_user).and_return(user)

        get :show
      end
    end
  end

  describe 'GET #edit' do
    context 'logged in' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'needs to be success' do
        get :edit, xhr: true

        expect(response).to be_success
      end

      it 'assigns user as current_user' do
        expect(controller).to receive(:current_user).and_return(user)

        get :edit, xhr: true
      end
    end

    context 'not logged in' do
      it 'needs to be success' do
        get :edit

        expect(response).to redirect_to(:root)
      end
    end
  end

  describe 'GET #update' do
    context 'logged in' do
      let(:valid_params) do
        { profile: { name: 'New Name' } }
      end

      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'needs to be success' do
        patch :update, params: valid_params, xhr: true

        expect(response).to be_success
      end

      it 'updates the current user with provided params' do
        patch :update, params: valid_params, xhr: true

        expect(user.reload.name).to eq('New Name')
      end

      it 'tries to update without valid value' do
        patch :update, params: { profile: { name: nil } }, xhr: true

        expect(user.reload.name).to eq('My Name')
      end
    end

    context 'not logged in' do
      it 'needs to be success' do
        patch :update

        expect(response).to redirect_to(:root)
      end
    end
  end
end
