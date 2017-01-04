require 'rails_helper'

feature 'Join', :omniauth do
  scenario 'user can join using valid credentials' do
    sign_in(create(:user))

    expect(page).to have_content logout_text
  end

  scenario 'user can not join using invalid credentials' do
    OmniAuth.config.mock_auth[:github] = :invalid_credentials

    visit '/'
    click_link login_text

    expect(page).to_not have_content logout_text
  end

  scenario 'user can not join using invalid session' do
    sign_in(create(:user))

    expect(User).to receive(:find)
      .and_raise(ActiveRecord::RecordNotFound).exactly(3).times

    visit '/'

    expect(page).to_not have_content logout_text
  end
end
