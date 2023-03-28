require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get additional_info" do
    get pages_additional_info_url
    assert_response :success
  end
end
