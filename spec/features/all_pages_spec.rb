require 'rails_helper'

describe 'All pages' do
  let!(:event)  { create(:event_not_happened) }
  let!(:member) { create(:user) }

  context 'Welcome' do
    it 'Exists next event' do
      visit '/'
      expect(page).to have_content event.name
    end

    it 'List members' do
      visit '/'
      expect(page).to have_content member.name
    end
  end

  context 'Event show' do
    it 'Shows name' do
      visit "/events/#{event.slug}"
      expect(page).to have_content event.name
    end

    it 'Shows date' do
      visit "/events/#{event.slug}"
      expect(page).to have_content event.occurred_at
    end

    it 'Shows local' do
      visit "/events/#{event.slug}"
      expect(page).to have_content event.local
    end

    it 'Shows description' do
      visit "/events/#{event.slug}"
      # TODO: How I can change to `event.description`?
      expect(page).to have_content 'Description'
    end
  end
end
