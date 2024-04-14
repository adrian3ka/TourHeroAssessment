class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show ]

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @add_ons = @trip.add_ons
  end

  def new
    @trip = Trip.new
    @trip.add_ons.build
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to @trip, notice: 'Trip was successfully created.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date, :description, :price)
    end
end
