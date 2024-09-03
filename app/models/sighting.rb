class Sighting < ApplicationRecord
  belongs_to :user
  belongs_to :cat, optional: true
  validates :description, :address, :last_seen_at, presence: true
end
