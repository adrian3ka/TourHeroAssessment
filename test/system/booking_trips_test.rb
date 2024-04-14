require "application_system_test_case"

class BookingTripsTest < ApplicationSystemTestCase
  setup do
    @booking_trip = booking_trips(:one)
  end

  test "visiting the index" do
    visit booking_trips_url
    assert_selector "h1", text: "Booking trips"
  end

  test "should create booking trip" do
    visit booking_trips_url
    click_on "New booking trip"

    fill_in "Trip", with: @booking_trip.trip_id
    fill_in "User", with: @booking_trip.user_id
    click_on "Create Booking trip"

    assert_text "Booking trip was successfully created"
    click_on "Back"
  end

  test "should update Booking trip" do
    visit booking_trip_url(@booking_trip)
    click_on "Edit this booking trip", match: :first

    fill_in "Trip", with: @booking_trip.trip_id
    fill_in "User", with: @booking_trip.user_id
    click_on "Update Booking trip"

    assert_text "Booking trip was successfully updated"
    click_on "Back"
  end

  test "should destroy Booking trip" do
    visit booking_trip_url(@booking_trip)
    click_on "Destroy this booking trip", match: :first

    assert_text "Booking trip was successfully destroyed"
  end
end
