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
    def login_text
      I18n.t 'shared.navbar.join'
    end

    def logout_text
      I18n.t 'shared.navbar.exit'
    end

    def create_text(model)
      I18n.t 'helpers.submit.create', model: model.model_name.human
    end

    def submit_text(model)
      I18n.t 'helpers.submit.submit', model: model.model_name.human
    end

    def update_text(model)
      I18n.t 'helpers.submit.update', model: model.model_name.human
    end

    def error_text_for(name, options = nil)
      I18n.t "errors.messages.#{name}", options
    end

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
