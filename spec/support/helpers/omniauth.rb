module Omniauth
  module Mock
    def auth_mock
      OmniAuth.config.mock_auth[:github] = OpenStruct.new(
        provider: 'github',
        uid: '2',
        info: OpenStruct.new(
          email: 'email@user.com',
          name: 'Email User',
          nickname: 'nickname-user',
          image: 'http://placehold.it/300'
        )
      )
    end
  end

  module SessionHelpers
    def sign_in
      visit '/'
      expect(page).to have_content("Join")
      auth_mock
      click_link "Join"
    end
  end
end
