class Customer::MainController < ApplicationController

	layout 'customer'
	add_flash_types :success, :info, :warning, :danger
end
