# test/models/booking_trip_test.rb
require 'test_helper'

class BookingTripTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @trip = trips(:one)
    @booking_trip = BookingTrip.new(user: @user, trip: @trip)
  end

  test "should be valid" do
    assert @booking_trip.valid?
  end

  test "should calculate total amount correctly" do
    add_on1 = add_ons(:one)
    add_on2 = add_ons(:two)
    add_on3 = add_ons(:three)
    @booking_trip.add_ons << add_on1
    @booking_trip.add_ons << add_on2
    @booking_trip.add_ons << add_on3

    expected_total_amount = @trip.price + add_on1.price + add_on2.price + add_on3.price
    assert_equal expected_total_amount, @booking_trip.total_amount
  end

  test "should not allow booking add-ons with conflicting times" do
    conflicting_add_on1 = add_ons(:conflicting_one)
    conflicting_add_on2 = add_ons(:conflicting_two)
    @booking_trip.add_ons << conflicting_add_on1
    @booking_trip.add_ons << conflicting_add_on2

    assert_not @booking_trip.valid?
    assert_includes @booking_trip.errors.full_messages, "Add-ons #{conflicting_add_on1.name} and #{conflicting_add_on2.name} have conflicting times"
  end
end
