require 'rails_helper'

feature 'Admin menu' do
  scenario 'can not be seen by unsigned user' do
    expect(page).to_not have_css '.admin-nav'
  end

  scenario 'can not be seen by normal user' do
    sign_in create(:user)
    expect(page).to_not have_css '.admin-nav'
  end

  scenario 'can be seen by admin user' do
    sign_in create(:user_admin)
    expect(page).to have_css '.admin-nav'
  end

  scenario 'must link to users admin' do
    sign_in create(:user_admin)
    expect(page).to have_link nil, href: admin_users_path
  end

  scenario 'must link to events admin' do
    sign_in create(:user_admin)
    expect(page).to have_link nil, href: admin_events_path
  end
end
