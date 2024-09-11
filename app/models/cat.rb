class Cat < ApplicationRecord
  belongs_to :user
  has_many :sightings, dependent: :destroy
  has_one_attached :photo
  validates :name, :color, :eye_color, :origin_address, :fur, :race, :description, :city, presence: true
  geocoded_by :origin_address, latitude: :origin_latitude, longitude: :origin_longitude
  after_validation :geocode_with_error_handling, if: :will_save_change_to_origin_address?

  include PgSearch::Model
  pg_search_scope :search_by_address, against: :origin_address, using: {
    tsearch: {
      prefix: true
    }
  }

  private

  def geocode_with_error_handling
    geocode
  rescue Geocoder::Error => e
    Rails.logger.error "Geocoding failed: #{e.message}"
  end
end
