require 'test_helper'

class Employee::ProductSalesAmountsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get employee_product_sales_amounts_show_url
    assert_response :success
  end

end
