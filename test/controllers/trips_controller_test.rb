# test/controllers/trips_controller_test.rb
require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @trip = trips(:one) # Assuming you have a fixture for trips
    @user = users(:one) # Assuming you have a fixture for users
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show trip" do
    get :show, params: { id: @trip.id }
    assert_response :success
  end

  test "should redirect to sign in for new trip if not logged in" do
    get :new
    assert_redirected_to new_user_session_path
  end

  test "should get new trip if logged in" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create trip" do
    sign_in @user
    assert_difference('Trip.count') do
      post :create, params: { trip: { name: @trip.name, start_date: @trip.start_date, end_date: @trip.end_date, description: @trip.description, price: @trip.price } }
    end

    assert_redirected_to trip_url(Trip.last)
  end
end
