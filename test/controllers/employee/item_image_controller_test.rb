require 'test_helper'

class Employee::ItemImageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get employee_item_image_show_url
    assert_response :success
  end

end
