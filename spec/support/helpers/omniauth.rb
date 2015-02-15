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
