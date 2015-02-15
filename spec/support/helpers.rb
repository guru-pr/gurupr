# TODO: Move module to other file
module Omniauth
  module Mock
    def auth_mock(user)
      OmniAuth.config.mock_auth[:github] = OpenStruct.new(
        provider: 'github',
        uid: user.uid,
        info: OpenStruct.new(
          email: user.email,
          name: user.name,
          nickname: user.nickname,
          image: user.image
        )
      )
    end
  end

  module SessionHelpers
    def sign_in(user)
      visit '/'
      expect(page).to have_content("Join")
      auth_mock(user)
      click_link "Join"
    end
  end
end

RSpec.configure do |config|
  config.include Omniauth::Mock
  config.include Omniauth::SessionHelpers, type: :feature
end

OmniAuth.config.test_mode = true
