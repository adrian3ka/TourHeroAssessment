# app/controllers/booking_trips_controller.rb
class BookingTripsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @trip = Trip.find(params[:trip_id])
    @booking_trip = BookingTrip.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @booking_trip = @trip.booking_trips.build(booking_trip_params)
    @booking_trip.user = current_user
    if @booking_trip.save && booking_trip_valid_for_spots_limit?
      redirect_to @trip, notice: 'Trip booked successfully.'
    else
      render :new
    end
  end

  private

  def booking_trip_params
    params.require(:booking_trip).permit(add_on_ids: [])
  end

  def booking_trip_valid_for_spots_limit?
    @booking_trip.add_ons.each do |add_on|
      unless add_on.bookable?
        errors.add(:base, "#{add_on.name} is fully booked")
        return false
      end
    end
    true
  end
end
