class Certificate < ApplicationRecord
  validates :user,  presence: true
  validates :event, presence: true

  belongs_to :user
  belongs_to :event

  delegate :name, :local, :occurred_at, :organizer, :duration, to: :event, prefix: true

  delegate :name, to: :user, prefix: :participant
end
