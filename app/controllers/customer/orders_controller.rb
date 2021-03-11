class Customer::OrdersController < ApplicationController
  #belongs_to :user

  def index
  end

  def confirm
    @users = User.all
    @user = User.find(params[:user_id])
    @order = Order.new
    @orders = Order.all
    @items = Item.all.descendingOrder
    @allTotal = Order.sumPrises(@orders)
  end

  def create
    #@users = User.all
    @user = User.find(params[:user_id])
    @order = Order.new(order_parameters)
    @allTotal = Order.sumPrises(@orders)
    @orders = Order.all

    if params[:order_time].blank?
      flash[:danger] = "受け取り時間を選択してください。"
      render :confirm
    elsif
        @order.save
        Order.create(order_parameters)
        redirect_to customer_user_order_url, success: '商品を確定しました。'
    else
      flash[:danger] = "商品確定ができませんでした。"
      render :confirm
    end
  end

  def show
    @user = User.find(params[:user_id])
    @order = Order.find(params[:id])
    @allTotal = Order.sumtPrises(@orders)
  end


  private
  def order_parameters
    params.permit(:name, :process, :price, :num, :order_date, :order_time, :user_id)
  end  

end
