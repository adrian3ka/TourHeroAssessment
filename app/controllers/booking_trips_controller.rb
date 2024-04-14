class BookingTripsController < ApplicationController
  before_action :set_booking_trip, only: %i[ show edit update destroy ]

  # GET /booking_trips or /booking_trips.json
  def index
    @booking_trips = BookingTrip.all
  end

  # GET /booking_trips/1 or /booking_trips/1.json
  def show
  end

  # GET /booking_trips/new
  def new
    @booking_trip = BookingTrip.new
  end

  # GET /booking_trips/1/edit
  def edit
  end

  # POST /booking_trips or /booking_trips.json
  def create
    @booking_trip = BookingTrip.new(booking_trip_params)

    respond_to do |format|
      if @booking_trip.save
        format.html { redirect_to booking_trip_url(@booking_trip), notice: "Booking trip was successfully created." }
        format.json { render :show, status: :created, location: @booking_trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_trips/1 or /booking_trips/1.json
  def update
    respond_to do |format|
      if @booking_trip.update(booking_trip_params)
        format.html { redirect_to booking_trip_url(@booking_trip), notice: "Booking trip was successfully updated." }
        format.json { render :show, status: :ok, location: @booking_trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_trips/1 or /booking_trips/1.json
  def destroy
    @booking_trip.destroy!

    respond_to do |format|
      format.html { redirect_to booking_trips_url, notice: "Booking trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_trip
      @booking_trip = BookingTrip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_trip_params
      params.require(:booking_trip).permit(:user_id, :trip_id)
    end
end
