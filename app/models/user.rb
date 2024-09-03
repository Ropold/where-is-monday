class User < ApplicationRecord
  has_many :cats, dependent: :destroy
  has_many :sightings
  has_many :cat_sightings, through: :cats, source: :sightings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_email_format_of :email
  validates :encrypted_password, :email, presence: true
  validates :encrypted_password, length: { minimum: 10 }
  validates :encrypted_password, format: { with: /\d/, message: 'must contain at least one number' }
end
