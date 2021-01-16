class Employee::MainController < ApplicationController
  layout 'employee'
  add_flash_types :success, :info, :warning, :danger
end