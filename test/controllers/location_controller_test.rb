require 'test_helper'

class LocationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get location_create_url
    assert_response :success
  end

  test "should get edit" do
    get location_edit_url
    assert_response :success
  end

  test "should get update" do
    get location_update_url
    assert_response :success
  end

end
