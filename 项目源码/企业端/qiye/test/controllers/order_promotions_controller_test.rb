require 'test_helper'

class OrderPromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_promotion = order_promotions(:one)
  end

  test "should get index" do
    get order_promotions_url
    assert_response :success
  end

  test "should get new" do
    get new_order_promotion_url
    assert_response :success
  end

  test "should create order_promotion" do
    assert_difference('OrderPromotion.count') do
      post order_promotions_url, params: { order_promotion: { coupon_list: @order_promotion.coupon_list, discount: @order_promotion.discount, kind: @order_promotion.kind, premise: @order_promotion.premise } }
    end

    assert_redirected_to order_promotion_url(OrderPromotion.last)
  end

  test "should show order_promotion" do
    get order_promotion_url(@order_promotion)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_promotion_url(@order_promotion)
    assert_response :success
  end

  test "should update order_promotion" do
    patch order_promotion_url(@order_promotion), params: { order_promotion: { coupon_list: @order_promotion.coupon_list, discount: @order_promotion.discount, kind: @order_promotion.kind, premise: @order_promotion.premise } }
    assert_redirected_to order_promotion_url(@order_promotion)
  end

  test "should destroy order_promotion" do
    assert_difference('OrderPromotion.count', -1) do
      delete order_promotion_url(@order_promotion)
    end

    assert_redirected_to order_promotions_url
  end
end
