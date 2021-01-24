require 'test_helper'

class Employee::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_users_index_url
    assert_response :success
  end

  test "should get new" do
    get employee_users_new_url
    assert_response :success
  end

  test "should get edit" do
    get employee_users_edit_url
    assert_response :success
  end

  test "should get show" do
    get employee_users_show_url
    assert_response :success
  end

end
