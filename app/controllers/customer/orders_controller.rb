class Customer::OrdersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @order = Order.find(params[:id])
  end

end
