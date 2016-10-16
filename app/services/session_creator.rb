require 'rest-client'

class SessionCreator
  attr_reader :auth, :user

  def initialize(auth)
    @auth = auth
    @user = User.find_or_initialize_by(provider: auth.provider, uid: auth.uid)
  end

  def call
    register_in_newsletter unless user.persisted?
    update_attributes

    true
  end

  private

  def register_in_newsletter
    splitted_name = auth.info.name.split
    first_name = splitted_name.first
    last_name = splitted_name.size > 1 ? splitted_name.last : nil

    data = [{ email: auth.info.email, first_name: first_name, last_name: last_name }].to_json
    opts = { content_type: :json, accept: :json, Authorization: "Bearer #{ENV['SENDGRID_API_KEY']}" }

    RestClient.post 'https://api.sendgrid.com/v3/contactdb/recipients', data, opts
  end

  def update_attributes
    user.update name: auth.info.name, email: auth.info.email, nickname: auth.info.nickname, image: auth.info.image
  end
end
