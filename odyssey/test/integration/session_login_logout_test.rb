require 'test_helper'

class SessionLoginLogoutTest < ActionDispatch::IntegrationTest
    
  def setup
    @user_admin = users(:bill)
  end
  
  # Check that the root URL is the login page
  test "Root URL is login page" do
    get root_path
    assert_template 'sessions/new'
    assert flash.empty?
  end
  
  # Check that going to a few different URLs will redirect
  #  to the login page if the user isn't logged in
  test "Various URLs redirect to login page, when not logged in" do
    get pickups_path
    assert_redirected_to login_path
    assert_not flash.empty? # Make sure there is an error message
    get days_new_path
    assert_redirected_to login_path
    assert_not flash.empty?
    get reports_path
    assert_redirected_to login_path
    assert_not flash.empty?
    get users_path
    assert_redirected_to login_path
    assert_not flash.empty?
  end
  
  # Check that the about page will render, when not logged in
  test "About page doesn't require login" do
    get about_path
    assert_template 'pages/about'
  end
  
  # Check that logging out will not work if the user is not logged in
  test "Logout won't work if not logged in" do
    delete logout_path
    assert_redirected_to login_path
    assert_not flash.empty?
  end
  
  # Verify that logging in with an invalid username/password will not work
  test "Invalid login won't work" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: "", password: "foobar"}
    assert_template 'sessions/new'
    assert_not flash.empty?
  end
  
  # Log in, verify that it goes to the homepage
  test "Log in test" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: @user_admin.user_id, 
        password: "password" }
    assert_redirected_to pickups_path
  end
  
  # Log in and log out, verify that it flashes a message
  test "Log out test" do
    # Log in
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: @user_admin.user_id,
        password: "password" }
    assert_redirected_to pickups_path
    
    # Log out
    delete logout_path
    assert_redirected_to login_path
    assert_not flash.empty?
  end
  
  # Verify that, after logging out, the user is redirected to the login page
  #  when they try and go to any other URL
  test "Log out and not be allowed to view other pages" do
    # Log in
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: @user_admin.user_id,
        password: "password" }
    assert_redirected_to pickups_path
    
    # Log out
    delete logout_path
    assert_redirected_to login_path
    assert_not flash.empty?
    
    # Try to go to another page
    get pickups_path
    assert_redirected_to login_path
    assert_not flash.empty?
  end
  
end
