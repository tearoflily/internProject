require 'test_helper'

class Employee::ProductMultiplesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employee_product_multiples_new_url
    assert_response :success
  end

  test "should get create" do
    get employee_product_multiples_create_url
    assert_response :success
  end

end
