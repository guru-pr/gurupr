require 'rails_helper'

feature 'Events' do
  scenario 'Title link to atom' do
    visit '/events/'
    expect(page).to have_link nil, href: events_url(format: 'atom')
  end
end
