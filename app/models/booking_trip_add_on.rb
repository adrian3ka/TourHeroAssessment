class BookingTripAddOn < ApplicationRecord
  belongs_to :booking_trip
  belongs_to :add_on
end
