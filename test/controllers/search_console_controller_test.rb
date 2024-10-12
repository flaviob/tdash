require "test_helper"

class SearchConsoleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_console_index_url
    assert_response :success
  end

  test "should get search_analytics" do
    get search_console_search_analytics_url
    assert_response :success
  end
end
