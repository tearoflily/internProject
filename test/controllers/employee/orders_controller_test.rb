require 'test_helper'

class Employee::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_orders_index_url
    assert_response :success
  end

  test "should get edit" do
    get employee_orders_edit_url
    assert_response :success
  end

  test "should get show" do
    get employee_orders_show_url
    assert_response :success
  end

end
