# test/controllers/add_ons_controller_test.rb
require 'test_helper'

class AddOnsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @trip = trips(:one) # Assuming you have a fixture for trips
    @users = users(:one)
  end

  test "should create add_on if valid" do
    sign_in @users
    assert_difference('AddOn.count') do
      post :create, params: { trip_id: @trip.id, add_on: { name: "Test Add-On", start_time: "10:00", end_time: "12:00", spot_limit: 10, description: "Test description", price: 50 } }
    end
    assert_redirected_to trip_path(@trip)
    assert_equal 'Add-on was successfully created.', flash[:notice]
  end
end
