require 'test_helper'

class Admin::RootControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_root_top_url
    assert_response :success
  end

end
