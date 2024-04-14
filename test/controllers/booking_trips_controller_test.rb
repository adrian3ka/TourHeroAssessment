require "test_helper"

class BookingTripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_trip = booking_trips(:one)
    @trip = trips(:one)
  end

  test "should get new" do
    get new_trip_booking_trip_path(@trip.id)
    assert_response 302
  end
end
