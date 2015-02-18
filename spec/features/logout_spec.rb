require 'rails_helper'

feature 'Logout', :omniauth do
  scenario 'user can logout' do
    sign_in(create(:user))

    visit '/'
    click_link logout_text
    expect(page).to have_content login_text
  end
end
