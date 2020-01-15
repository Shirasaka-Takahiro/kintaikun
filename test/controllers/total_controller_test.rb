require 'test_helper'

class TotalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get total_index_url
    assert_response :success
  end

  test "should get new" do
    get total_new_url
    assert_response :success
  end

end
