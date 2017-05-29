require 'test_helper'

class GoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get goods_list_url
    assert_response :success
  end

  test "should get buy" do
    get goods_buy_url
    assert_response :success
  end

end
