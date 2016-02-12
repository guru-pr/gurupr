class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name,        presence: true, uniqueness: true
  validates :slug,        presence: true, uniqueness: true
  validates :summary,     presence: true
  validates :description, presence: true
  validates :occurred_at, presence: true
  validates :local,       presence: true
  validates :address,     presence: true

  scope :not_happened, -> { where('occurred_at > ?', Time.current.yesterday).order(occurred_at: :asc) }
end
