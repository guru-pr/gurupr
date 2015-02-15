require 'rails_helper'

feature 'Logout', :omniauth do
  scenario 'user can logout' do
    sign_in

    visit '/'
    click_link 'Logout'
    expect(page).to have_content 'Join'
  end
end