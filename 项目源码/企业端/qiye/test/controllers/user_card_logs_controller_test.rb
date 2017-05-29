require 'test_helper'

class UserCardLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_card_log = user_card_logs(:one)
  end

  test "should get index" do
    get user_card_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_user_card_log_url
    assert_response :success
  end

  test "should create user_card_log" do
    assert_difference('UserCardLog.count') do
      post user_card_logs_url, params: { user_card_log: { fake_money: @user_card_log.fake_money, kind: @user_card_log.kind, loggable_id: @user_card_log.loggable_id, loggable_type: @user_card_log.loggable_type, real_money: @user_card_log.real_money } }
    end

    assert_redirected_to user_card_log_url(UserCardLog.last)
  end

  test "should show user_card_log" do
    get user_card_log_url(@user_card_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_card_log_url(@user_card_log)
    assert_response :success
  end

  test "should update user_card_log" do
    patch user_card_log_url(@user_card_log), params: { user_card_log: { fake_money: @user_card_log.fake_money, kind: @user_card_log.kind, loggable_id: @user_card_log.loggable_id, loggable_type: @user_card_log.loggable_type, real_money: @user_card_log.real_money } }
    assert_redirected_to user_card_log_url(@user_card_log)
  end

  test "should destroy user_card_log" do
    assert_difference('UserCardLog.count', -1) do
      delete user_card_log_url(@user_card_log)
    end

    assert_redirected_to user_card_logs_url
  end
end
