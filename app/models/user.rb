class User < ActiveRecord::Base
  validates :provider, presence: true, inclusion: { in: %w(github) }
  validates :uid,      presence: true, uniqueness: { scope: :provider }
  validates :name,     presence: true
  validates :email,    presence: true
  validates :nickname, presence: true
  validates :image,    presence: true
end
