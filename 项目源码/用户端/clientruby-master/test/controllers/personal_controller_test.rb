require 'test_helper'

class PersonalControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get personal_profile_url
    assert_response :success
  end

  test "should get address" do
    get personal_address_url
    assert_response :success
  end

end
