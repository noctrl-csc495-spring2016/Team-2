require 'test_helper'

class ReportsControllerTest < ActionController::TestCase

  test "should donor report form" do
    log_in_as(users(:bill))
    get :donor
    assert_response :success
  end
  
  test "should get truck report form" do
    log_in_as(users(:bill))
    get :truck
    assert_response :success
  end
  
  test "should get main reports page" do
    log_in_as(users(:bill))
    get :reports
    assert_response :success
  end
end
