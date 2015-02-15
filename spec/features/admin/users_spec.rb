require 'rails_helper'

feature 'Admin users', :omniauth do
  scenario 'unlogged user redirect to root' do
    visit '/admin/users'

    expect(page.current_path).to eq root_path
  end

  scenario 'logged user (not admin) redirect to root' do
    sign_in(create(:user))

    visit '/admin/users'

    expect(page.current_path).to eq root_path
  end

  scenario 'logged user list admin and normal users' do
    admin  = create(:user_admin)
    normal = create(:user)
    sign_in(admin)

    visit '/admin/users'

    # TODO: Improve this... (;
    expect(first("a[href='/admin/users/#{admin.id}/accesses']").text).to eq 'Revoke'
    expect(first("a[href='/admin/users/#{normal.id}/accesses']").text).to eq 'Grant'
  end
end
