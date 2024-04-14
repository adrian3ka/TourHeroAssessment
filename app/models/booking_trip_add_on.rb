class BookingTripAddOn < ApplicationRecord
  belongs_to :booking_trip
  belongs_to :add_on

  validate :spots_limit_not_exceeded

  private
  def spots_limit_not_exceeded
    add_on = self.add_on
    return if add_on.spot_limit.nil? || add_on.spot_limit > add_on.booking_trip_add_ons.count

    errors.add(:base, "Spot limit exceeded for #{add_on.name}")
  end
end
