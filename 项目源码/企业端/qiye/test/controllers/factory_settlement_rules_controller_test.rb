require 'test_helper'

class FactorySettlementRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @factory_settlement_rule = factory_settlement_rules(:one)
  end

  test "should get index" do
    get factory_settlement_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_factory_settlement_rule_url
    assert_response :success
  end

  test "should create factory_settlement_rule" do
    assert_difference('FactorySettlementRule.count') do
      post factory_settlement_rules_url, params: { factory_settlement_rule: { factory_id: @factory_settlement_rule.factory_id, from_date: @factory_settlement_rule.from_date, priority: @factory_settlement_rule.priority, settlement_rule_id: @factory_settlement_rule.settlement_rule_id } }
    end

    assert_redirected_to factory_settlement_rule_url(FactorySettlementRule.last)
  end

  test "should show factory_settlement_rule" do
    get factory_settlement_rule_url(@factory_settlement_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_factory_settlement_rule_url(@factory_settlement_rule)
    assert_response :success
  end

  test "should update factory_settlement_rule" do
    patch factory_settlement_rule_url(@factory_settlement_rule), params: { factory_settlement_rule: { factory_id: @factory_settlement_rule.factory_id, from_date: @factory_settlement_rule.from_date, priority: @factory_settlement_rule.priority, settlement_rule_id: @factory_settlement_rule.settlement_rule_id } }
    assert_redirected_to factory_settlement_rule_url(@factory_settlement_rule)
  end

  test "should destroy factory_settlement_rule" do
    assert_difference('FactorySettlementRule.count', -1) do
      delete factory_settlement_rule_url(@factory_settlement_rule)
    end

    assert_redirected_to factory_settlement_rules_url
  end
end
