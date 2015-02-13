class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name,        presence: true
  validates :slug,        presence: true, uniqueness: true
  validates :occurred_at, presence: true
  validates :local,       presence: true
  validates :address,     presence: true

  default_scope { order(occurred_at: :asc) }
  scope :not_happened, -> { where('occurred_at > ?', Time.zone.now) }
end
