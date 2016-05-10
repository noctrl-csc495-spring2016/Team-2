require 'test_helper'

class DaysControllerTest < ActionController::TestCase
  setup do
    @user = users(:bill)
    @day = days(:one)
  end

  test "should get index" do
    log_in_as(users(:bill))
    
    get :index
    assert_response :success
    assert_not_nil assigns(:days)
  end

  test "should get new" do
    log_in_as(users(:bill))
    
    get :new
    assert_response :success
  end

  test "should create day" do
    log_in_as(users(:bill))
    
    assert_difference('Day.count') do
      post :create, { month: 'December', day: 25, year: 2016 }
    end
  
    assert_redirected_to days_path
  end

  test "should show day" do
    log_in_as(users(:bill))
    
    get :show, id: @day
    assert_response :success
  end

  #test "should destroy day" do
  #  assert_difference('Day.count', -1) do
  #    delete :destroy, id: @day
  #  end
  #
  #  assert_redirected_to days_path
  #end
  
  test "cant duplicate a day" do
    log_in_as(users(:bill))
    
    assert_difference('Day.count') do
      post :create, { month: 'December', day: 26, year: 2016 }
    end
    
    assert_no_difference('Day.count') do
      post :create, { month: 'December', day: 26, year: 2016 }
    end
    
    assert_redirected_to days_new_path
  end
  
  test "cant enter a day in the past" do
    log_in_as(users(:bill))
    
    assert_no_difference('Day.count') do
      post :create, { month: 'January', day: 01, year: 1990 }
    end
    
    assert_redirected_to :days_new
  end
end
