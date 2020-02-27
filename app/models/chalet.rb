class Chalet < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: { scope: :country }
  validates :number_of_guests, presence: true, numericality: { only_integer: true }
  validates :number_of_guests, numericality: { greater_than: 0 }
  validates :number_of_bedrooms, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: true
  validates :user_id, presence: true
  has_many_attached :photos
end
