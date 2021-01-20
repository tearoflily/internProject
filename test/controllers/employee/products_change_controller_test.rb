require 'test_helper'

class Employee::ProductsChangeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_products_change_index_url
    assert_response :success
  end

end
