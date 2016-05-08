require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:bill)
    @other = users(:archer)
  end

  test "should get index" do
    log_in_as(users(:bill))
    get :index
    assert_response :success
    #assert_not_nil assigns(:users)
  end

  test "should get new" do
    log_in_as(users(:bill))
    get :new
    assert_response :success
  end

  test "should create user" do
    log_in_as(users(:bill))

    assert_difference('User.count') do
      post :create, user: { user_id:"charlessss", user_email:"charles@charles.com", permission_level: 2 , password: "password", password_confirmation: "password" }
    end

    assert_redirected_to users_index_path
  end

  test "should show user" do
    log_in_as(users(:bill))
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    log_in_as(users(:bill))
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    log_in_as(users(:bill))
    patch :update, id: @user, user: { password: "charlie", password_confirmation: "charlie" }
    assert_redirected_to users_url
  end

  test "should destroy user" do
    log_in_as(users(:bill))
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
