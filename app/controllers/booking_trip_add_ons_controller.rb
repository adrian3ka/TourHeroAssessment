class BookingTripAddOnsController < ApplicationController
  before_action :set_booking_trip_add_on, only: %i[ show edit update destroy ]

  # GET /booking_trip_add_ons or /booking_trip_add_ons.json
  def index
    @booking_trip_add_ons = BookingTripAddOn.all
  end

  # GET /booking_trip_add_ons/1 or /booking_trip_add_ons/1.json
  def show
  end

  # GET /booking_trip_add_ons/new
  def new
    @booking_trip_add_on = BookingTripAddOn.new
  end

  # GET /booking_trip_add_ons/1/edit
  def edit
  end

  # POST /booking_trip_add_ons or /booking_trip_add_ons.json
  def create
    @booking_trip_add_on = BookingTripAddOn.new(booking_trip_add_on_params)

    respond_to do |format|
      if @booking_trip_add_on.save
        format.html { redirect_to booking_trip_add_on_url(@booking_trip_add_on), notice: "Booking trip add on was successfully created." }
        format.json { render :show, status: :created, location: @booking_trip_add_on }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking_trip_add_on.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_trip_add_ons/1 or /booking_trip_add_ons/1.json
  def update
    respond_to do |format|
      if @booking_trip_add_on.update(booking_trip_add_on_params)
        format.html { redirect_to booking_trip_add_on_url(@booking_trip_add_on), notice: "Booking trip add on was successfully updated." }
        format.json { render :show, status: :ok, location: @booking_trip_add_on }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking_trip_add_on.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_trip_add_ons/1 or /booking_trip_add_ons/1.json
  def destroy
    @booking_trip_add_on.destroy!

    respond_to do |format|
      format.html { redirect_to booking_trip_add_ons_url, notice: "Booking trip add on was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_trip_add_on
      @booking_trip_add_on = BookingTripAddOn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_trip_add_on_params
      params.require(:booking_trip_add_on).permit(:booking_trip_id, :add_on_id)
    end
end
