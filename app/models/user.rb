class User < ActiveRecord::Base
  validates :provider, presence: true, inclusion: { in: %w(github) }
  validates :uid,      presence: true, uniqueness: { scope: :provider }
  validates :name,     presence: true
  validates :email,    presence: true
  validates :nickname, presence: true
  validates :image,    presence: true

  scope :admin,  -> { where(admin: true) }
  scope :normal, -> { where(admin: false) }

  def self.find_or_create_with_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    user.update name:     auth.info.name,
                email:    auth.info.email,
                nickname: auth.info.nickname,
                image:    auth.info.image
    user
  end
end
