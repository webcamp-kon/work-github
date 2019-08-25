require 'test_helper'

class Admin::OrderHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_order_histories_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_order_histories_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_order_histories_update_url
    assert_response :success
  end

  test "should get create" do
    get admin_order_histories_create_url
    assert_response :success
  end

end
