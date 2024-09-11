class Sighting < ApplicationRecord
  belongs_to :user
  belongs_to :cat, optional: true
  enum status: { pending: "pending", accepted: "accepted", rejected: "rejected" }

  has_one_attached :photo
  validates :description, :address, :last_seen_at, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_address, against: :address, using: {
    tsearch: {
      prefix: true
    }
  }
end
