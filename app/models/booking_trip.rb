class BookingTrip < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  has_many :booking_trip_add_ons
  has_many :add_ons, through: :booking_trip_add_ons
end
