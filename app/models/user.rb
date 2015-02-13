class User < ActiveRecord::Base
  validates :provider, presence: true, inclusion: { in: %w(github) }
  validates :uid,      presence: true, uniqueness: { scope: :provider }
  validates :name,     presence: true
  validates :email,    presence: true
  validates :nickname, presence: true
  validates :image,    presence: true

  def self.find_or_create_with_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name     = auth.info.name
      user.email    = auth.info.email
      user.nickname = auth.info.nickname
      user.image    = auth.info.image
    end
  end
end
