class Sighting < ApplicationRecord
  belongs_to :user
  belongs_to :cat, optional: true
  validates :description, :address, :last_seen_at, :city, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_city,
  against: :city,
  using: {
    tsearch: {
      prefix: true
    }
  }
end
