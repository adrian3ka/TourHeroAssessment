# test/models/booking_trip_add_on_test.rb
require 'test_helper'

class BookingTripAddOnTest < ActiveSupport::TestCase
  test "should not exceed spots limit" do
    add_on = add_ons(:one)
    booking_trip = booking_trips(:one)
    booking_trip_add_on = BookingTripAddOn.new(add_on: add_on, booking_trip: booking_trip)

    # Set the spot limit of the add-on to a value less than the current count of booking trip add-ons
    add_on.update(spot_limit: booking_trip.booking_trip_add_ons.count - 1)

    assert_not booking_trip_add_on.valid?
    assert_includes booking_trip_add_on.errors.full_messages, "Spot limit exceeded for #{add_on.name}"
  end
end
