require 'test_helper'

class SessionAuthorizationRestrictionsTest < ActionDispatch::IntegrationTest
  def setup
    @user_admin = users(:bill)
    @user_entry = users(:guy)
    @user_standard = users(:archer)
  end
  
  # Log in with Entry user
  test "Log in entry" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: @user_entry.user_id, 
        password: "password" }
    assert_redirected_to pickups_path
  end
  
  # Make sure Entry can view Pickups, and
  #                 cannot view Admin, Schedule or Reports
  test "Entry authorizations" do
    # Log in
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: @user_entry.user_id, 
        password: "password" }
    assert_redirected_to pickups_path
    
    # Go to pickups
    get pickups_path
    assert_template 'pickups/index'
    assert flash.empty?
    
    # Fail to go to Admin
    get users_path
    assert_redirected_to pickups_path
    assert_not flash.empty?
    
    # Fail to go to Schedule
    get days_path
    assert_redirected_to pickups_path
    assert_not flash.empty?
    
    # Fail to go to Reports
    get reports_path
    assert_redirected_to pickups_path
    assert_not flash.empty?
  end
  # Make sure Entry can view their own user page
  test "Entry views own user page" do
    # Log in
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: @user_entry.user_id, 
        password: "password" }
    assert_redirected_to pickups_path
    
    # Try to view the user page
    get edit_user_path(@user_entry.id)
    assert_template 'users/edit'
    assert flash.empty?
  end
  
  
  # Log in with Standard user
  test "Log in standard" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: @user_standard.user_id, 
        password: "password" }
    assert_redirected_to pickups_path
  end
  
  # Make sure Standard can view Pickups, Schedule, Reports, and
  #                    cannot view Admin
  test "Standard authorizations" do
    # Log in
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: @user_standard.user_id, 
        password: "password" }
    assert_redirected_to pickups_path
    
    # Go to pickups
    get pickups_path
    assert_template 'pickups/index'
    assert flash.empty?
    
    # Go to Schedule
    get days_path
    assert_template 'days/index'
    assert flash.empty?
    
    # Go to Reports
    get reports_path
    assert_template 'reports'
    assert flash.empty?
    
    # Fail to go to Admin
    get users_path
    assert_redirected_to pickups_path
    assert_not flash.empty?
  end
  # Make sure Standard can view their own user page
  test "Standard views own user page" do
    # Log in
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: @user_standard.user_id, 
        password: "password" }
    assert_redirected_to pickups_path
    
    # Try to view the user page
    get edit_user_path(@user_standard.id)
    assert_template 'users/edit'
    assert flash.empty?
  end
  
  
  # Log in with Admin user
  test "Log in admin" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: @user_admin.user_id, 
        password: "password" }
    assert_redirected_to pickups_path
  end
  
  # Make sure Admin can view Pickups, Schedule, Reports, and Admin
  test "Admin authorizations" do
    # Log in
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: @user_admin.user_id, 
        password: "password" }
    assert_redirected_to pickups_path
    
    # Go to pickups
    get pickups_path
    assert_template 'pickups/index'
    assert flash.empty?
    
    # Go to Schedule
    get days_path
    assert_template 'days/index'
    assert flash.empty?
    
    # Go to Reports
    get reports_path
    assert_template 'reports'
    assert flash.empty?
    
    # Go to Admin
    get users_path
    assert_template 'users/index'
    assert flash.empty?
  end
  
  # Make sure Admin can view their own user page
  test "Admin views own user page" do
    # Log in
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { user_id: @user_admin.user_id, 
        password: "password" }
    assert_redirected_to pickups_path
    
    # Try to view the user page
    get edit_user_path(@user_admin.id)
    assert_template 'users/edit'
    assert flash.empty?
  end
  
end
