require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  render_views
  describe 'GET events.atom' do
    it 'renders the atom' do
      create(:event)
      get :index, format: 'atom'
      expect(response.body).to match('<title>event</title>')
    end
  end
end
