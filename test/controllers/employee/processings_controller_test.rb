require 'test_helper'

class Employee::ProcessingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employee_processings_new_url
    assert_response :success
  end

end
