class User < ApplicationRecord
  validates :provider, presence: true, inclusion: { in: %w(github) }
  validates :uid,      presence: true, uniqueness: { scope: :provider }
  validates :name,     presence: true
  validates :email,    presence: true
  validates :nickname, presence: true
  validates :image,    presence: true

  has_many :certificates

  scope :admin,  -> { where(admin: true) }
  scope :normal, -> { where(admin: false) }
end
