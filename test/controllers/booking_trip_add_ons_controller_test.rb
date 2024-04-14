require "test_helper"

class BookingTripAddOnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_trip_add_on = booking_trip_add_ons(:one)
  end

  test "should get index" do
    get booking_trip_add_ons_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_trip_add_on_url
    assert_response :success
  end

  test "should create booking_trip_add_on" do
    assert_difference("BookingTripAddOn.count") do
      post booking_trip_add_ons_url, params: { booking_trip_add_on: { add_on_id: @booking_trip_add_on.add_on_id, booking_trip_id: @booking_trip_add_on.booking_trip_id } }
    end

    assert_redirected_to booking_trip_add_on_url(BookingTripAddOn.last)
  end

  test "should show booking_trip_add_on" do
    get booking_trip_add_on_url(@booking_trip_add_on)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_trip_add_on_url(@booking_trip_add_on)
    assert_response :success
  end

  test "should update booking_trip_add_on" do
    patch booking_trip_add_on_url(@booking_trip_add_on), params: { booking_trip_add_on: { add_on_id: @booking_trip_add_on.add_on_id, booking_trip_id: @booking_trip_add_on.booking_trip_id } }
    assert_redirected_to booking_trip_add_on_url(@booking_trip_add_on)
  end

  test "should destroy booking_trip_add_on" do
    assert_difference("BookingTripAddOn.count", -1) do
      delete booking_trip_add_on_url(@booking_trip_add_on)
    end

    assert_redirected_to booking_trip_add_ons_url
  end
end
