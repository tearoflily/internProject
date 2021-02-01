require 'test_helper'

class Employee::SalesManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_sales_managements_index_url
    assert_response :success
  end

end
