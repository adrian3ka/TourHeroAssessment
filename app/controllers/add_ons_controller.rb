# app/controllers/add_ons_controller.rb
class AddOnsController < ApplicationController
  before_action :set_trip
  before_action :authenticate_user!, only: [:new, :create]

  # GET /trips/:trip_id/add_ons/new
  def new
    @add_on = @trip.add_ons.build
  end

  # POST /trips/:trip_id/add_ons
  def create
    @add_on = @trip.add_ons.build(add_on_params)
    if @add_on.save
      redirect_to @trip, notice: 'Add-on was successfully created.'
    else
      render :new
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_add_on
    @add_on = @trip.add_ons.find(params[:id])
  end

  def add_on_params
    params.require(:add_on).permit(:name, :start_time, :end_time, :spot_limit, :description, :price)
  end
end
