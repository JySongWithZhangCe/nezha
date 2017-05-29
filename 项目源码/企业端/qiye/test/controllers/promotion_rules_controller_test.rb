require 'test_helper'

class PromotionRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promotion_rule = promotion_rules(:one)
  end

  test "should get index" do
    get promotion_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_promotion_rule_url
    assert_response :success
  end

  test "should create promotion_rule" do
    assert_difference('PromotionRule.count') do
      post promotion_rules_url, params: { promotion_rule: { coupon_list_id: @promotion_rule.coupon_list_id, end_on: @promotion_rule.end_on, start_on: @promotion_rule.start_on } }
    end

    assert_redirected_to promotion_rule_url(PromotionRule.last)
  end

  test "should show promotion_rule" do
    get promotion_rule_url(@promotion_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_promotion_rule_url(@promotion_rule)
    assert_response :success
  end

  test "should update promotion_rule" do
    patch promotion_rule_url(@promotion_rule), params: { promotion_rule: { coupon_list_id: @promotion_rule.coupon_list_id, end_on: @promotion_rule.end_on, start_on: @promotion_rule.start_on } }
    assert_redirected_to promotion_rule_url(@promotion_rule)
  end

  test "should destroy promotion_rule" do
    assert_difference('PromotionRule.count', -1) do
      delete promotion_rule_url(@promotion_rule)
    end

    assert_redirected_to promotion_rules_url
  end
end
