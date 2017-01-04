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

  CONTACT_DB_URL = 'https://api.sendgrid.com/v3/contactdb/recipients'.freeze
  SENDGRID_OPTS = {
    content_type: :json, accept: :json,
    Authorization: "Bearer #{ENV['SENDGRID_API_KEY']}"
  }.freeze

  def register_in_newsletter
    splitted_name = auth.info.name.split
    first_name = splitted_name.first
    last_name = splitted_name.size > 1 ? splitted_name.last : nil

    data = [
      { email: auth.info.email, first_name: first_name, last_name: last_name }
    ].to_json

    RestClient.post CONTACT_DB_URL, data, SENDGRID_OPTS
  end

  def update_attributes
    user.update name: auth.info.name,
                email: auth.info.email,
                nickname: auth.info.nickname,
                image: auth.info.image
  end
end
