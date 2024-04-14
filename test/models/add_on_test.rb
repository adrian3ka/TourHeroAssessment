# test/models/add_on_test.rb
require 'test_helper'

class AddOnTest < ActiveSupport::TestCase
  setup do
    @add_on = add_ons(:one) # Assuming you have a fixture for add_ons
  end

  test "name should be present" do
    @add_on.name = ""
    assert_not @add_on.valid?
  end

  test "description should be present" do
    @add_on.description = ""
    assert_not @add_on.valid?
  end

  test "start_time should be present" do
    @add_on.start_time = nil
    assert_not @add_on.valid?
  end

  test "end_time should be present" do
    @add_on.end_time = nil
    assert_not @add_on.valid?
  end

  test "price should be present" do
    @add_on.price = nil
    assert_not @add_on.valid?
  end

  test "bookable? should return true if spot_limit is nil" do
    @add_on.spot_limit = nil
    assert @add_on.bookable?
  end

  test "bookable? should return true if spot_limit is greater than booking_trip_add_ons count" do
    @add_on.spot_limit = 5
    assert @add_on.bookable?
  end
end
