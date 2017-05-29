require 'test_helper'

class SettlementPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @settlement_price = settlement_prices(:one)
  end

  test "should get index" do
    get settlement_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_settlement_price_url
    assert_response :success
  end

  test "should create settlement_price" do
    assert_difference('SettlementPrice.count') do
      post settlement_prices_url, params: { settlement_price: { price: @settlement_price.price, product_id: @settlement_price.product_id, settlement_rule_id: @settlement_price.settlement_rule_id } }
    end

    assert_redirected_to settlement_price_url(SettlementPrice.last)
  end

  test "should show settlement_price" do
    get settlement_price_url(@settlement_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_settlement_price_url(@settlement_price)
    assert_response :success
  end

  test "should update settlement_price" do
    patch settlement_price_url(@settlement_price), params: { settlement_price: { price: @settlement_price.price, product_id: @settlement_price.product_id, settlement_rule_id: @settlement_price.settlement_rule_id } }
    assert_redirected_to settlement_price_url(@settlement_price)
  end

  test "should destroy settlement_price" do
    assert_difference('SettlementPrice.count', -1) do
      delete settlement_price_url(@settlement_price)
    end

    assert_redirected_to settlement_prices_url
  end
end
