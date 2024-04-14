require "application_system_test_case"

class BookingTripAddOnsTest < ApplicationSystemTestCase
  setup do
    @booking_trip_add_on = booking_trip_add_ons(:one)
  end

  test "visiting the index" do
    visit booking_trip_add_ons_url
    assert_selector "h1", text: "Booking trip add ons"
  end

  test "should create booking trip add on" do
    visit booking_trip_add_ons_url
    click_on "New booking trip add on"

    fill_in "Add on", with: @booking_trip_add_on.add_on_id
    fill_in "Booking trip", with: @booking_trip_add_on.booking_trip_id
    click_on "Create Booking trip add on"

    assert_text "Booking trip add on was successfully created"
    click_on "Back"
  end

  test "should update Booking trip add on" do
    visit booking_trip_add_on_url(@booking_trip_add_on)
    click_on "Edit this booking trip add on", match: :first

    fill_in "Add on", with: @booking_trip_add_on.add_on_id
    fill_in "Booking trip", with: @booking_trip_add_on.booking_trip_id
    click_on "Update Booking trip add on"

    assert_text "Booking trip add on was successfully updated"
    click_on "Back"
  end

  test "should destroy Booking trip add on" do
    visit booking_trip_add_on_url(@booking_trip_add_on)
    click_on "Destroy this booking trip add on", match: :first

    assert_text "Booking trip add on was successfully destroyed"
  end
end
