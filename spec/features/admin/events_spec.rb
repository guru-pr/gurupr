require 'rails_helper'

feature 'Admin events', :omniauth do
  scenario 'unlogged user redirect to root' do
    visit '/admin/events'

    expect(page.current_path).to eq root_path
  end

  scenario 'logged user (not admin) redirect to root' do
    sign_in(create(:user))

    visit '/admin/events'

    expect(page.current_path).to eq root_path
  end

  context 'logged user' do
    before { sign_in(create(:user_admin)) }

    scenario 'list events on index page' do
      happened     = create(:event_happened)
      not_happened = create(:event_not_happened)

      visit '/admin/events'

      %i(name local address occurred_at).each do |field|
        expect(page).to have_content happened.send(field)
        expect(page).to have_content not_happened.send(field)
      end
    end
  end
end
