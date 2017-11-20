require 'test_helper'

class TestControllerTest < ActionDispatch::IntegrationTest
  test "should get test2x" do
    get test_test2x_url
    assert_response :success
  end

end
