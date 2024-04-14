require "test_helper"

class BookingTripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_trip = booking_trips(:one)
  end

  test "should get index" do
    get booking_trips_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_trip_url
    assert_response :success
  end

  test "should create booking_trip" do
    assert_difference("BookingTrip.count") do
      post booking_trips_url, params: { booking_trip: { trip_id: @booking_trip.trip_id, user_id: @booking_trip.user_id } }
    end

    assert_redirected_to booking_trip_url(BookingTrip.last)
  end

  test "should show booking_trip" do
    get booking_trip_url(@booking_trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_trip_url(@booking_trip)
    assert_response :success
  end

  test "should update booking_trip" do
    patch booking_trip_url(@booking_trip), params: { booking_trip: { trip_id: @booking_trip.trip_id, user_id: @booking_trip.user_id } }
    assert_redirected_to booking_trip_url(@booking_trip)
  end

  test "should destroy booking_trip" do
    assert_difference("BookingTrip.count", -1) do
      delete booking_trip_url(@booking_trip)
    end

    assert_redirected_to booking_trips_url
  end
end
