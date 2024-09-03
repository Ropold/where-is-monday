class Cat < ApplicationRecord
  belongs_to :user
  has_many :sightings
  validates :name, :color, :eye_color, :origin_address, :fur, :race, :description, presence: true
end
