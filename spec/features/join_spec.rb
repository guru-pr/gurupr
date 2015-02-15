require 'rails_helper'

feature 'Join', :omniauth do
  scenario 'user can join using valid credentials' do
    sign_in

    expect(page).to have_content 'Logout'
  end

  scenario 'user can not join using invalid credentials' do
    OmniAuth.config.mock_auth[:github] = :invalid_credentials

    visit '/'
    click_link 'Join'

    expect(page).to_not have_content 'Logout'
  end
end