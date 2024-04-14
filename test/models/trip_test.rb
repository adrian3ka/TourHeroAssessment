# test/models/trip_test.rb
require 'test_helper'

class TripTest < ActiveSupport::TestCase
  test "should not save trip without name" do
    trip = Trip.new
    assert_not trip.save, "Saved the trip without a name"
  end

  test "should not save trip without description" do
    trip = Trip.new
    assert_not trip.save, "Saved the trip without a description"
  end

  test "should not save trip without start date" do
    trip = Trip.new
    assert_not trip.save, "Saved the trip without a start date"
  end

  test "should not save trip without end date" do
    trip = Trip.new
    assert_not trip.save, "Saved the trip without an end date"
  end

  test "should not save trip without price" do
    trip = Trip.new
    assert_not trip.save, "Saved the trip without a price"
  end

  test "end date should be after start date" do
    trip = Trip.new(start_date: Date.today, end_date: Date.today - 1)
    assert_not trip.valid?, "Saved the trip with end date before start date"
  end

  test "should return true if the user has booked the trip" do
    user = users(:three)
    trip = trips(:one)
    booking_trip = BookingTrip.create(trip: trip, user: user)
    assert trip.booked_by_user?(user), "Did not return true for user who booked the trip"
  end

  test "should return false if the user has not booked the trip" do
    user = users(:three)
    trip = trips(:two)
    assert_not trip.booked_by_user?(user), "Did not return false for user who did not book the trip"
  end
end
