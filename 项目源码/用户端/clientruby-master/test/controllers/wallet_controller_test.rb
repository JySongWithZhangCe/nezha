require 'test_helper'

class WalletControllerTest < ActionDispatch::IntegrationTest
  test "should get mywa" do
    get wallet_mywa_url
    assert_response :success
  end

end
