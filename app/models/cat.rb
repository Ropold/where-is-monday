class Cat < ApplicationRecord
  belongs_to :user
  has_many :sightings, dependent: :destroy
  has_one_attached :photo
  validates :name, :color, :eye_color, :origin_address, :fur, :race, :description, :city, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_city,
  against: :city,
  using: {
    tsearch: {
      prefix: true
    }
  }
end
