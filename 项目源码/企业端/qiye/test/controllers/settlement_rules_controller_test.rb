require 'test_helper'

class SettlementRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @settlement_rule = settlement_rules(:one)
  end

  test "should get index" do
    get settlement_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_settlement_rule_url
    assert_response :success
  end

  test "should create settlement_rule" do
    assert_difference('SettlementRule.count') do
      post settlement_rules_url, params: { settlement_rule: { category_id: @settlement_rule.category_id, city_id: @settlement_rule.city_id, comment: @settlement_rule.comment, name: @settlement_rule.name } }
    end

    assert_redirected_to settlement_rule_url(SettlementRule.last)
  end

  test "should show settlement_rule" do
    get settlement_rule_url(@settlement_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_settlement_rule_url(@settlement_rule)
    assert_response :success
  end

  test "should update settlement_rule" do
    patch settlement_rule_url(@settlement_rule), params: { settlement_rule: { category_id: @settlement_rule.category_id, city_id: @settlement_rule.city_id, comment: @settlement_rule.comment, name: @settlement_rule.name } }
    assert_redirected_to settlement_rule_url(@settlement_rule)
  end

  test "should destroy settlement_rule" do
    assert_difference('SettlementRule.count', -1) do
      delete settlement_rule_url(@settlement_rule)
    end

    assert_redirected_to settlement_rules_url
  end
end
