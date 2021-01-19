require 'test_helper'

class Employee::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_products_index_url
    assert_response :success
  end

  test "should get new" do
    get employee_products_new_url
    assert_response :success
  end

  test "should get edit" do
    get employee_products_edit_url
    assert_response :success
  end

end
