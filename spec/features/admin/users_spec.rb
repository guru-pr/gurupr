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

    expect(get_class_from_tag(admin)).to include 'btn-revoke'
    expect(get_class_from_tag(normal)).to include 'btn-grant'
  end

  protected

  def get_class_from_tag(user)
    first("a[href='/admin/users/#{user.id}/accesses']")['class']
  end
end
