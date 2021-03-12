class Customer::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  def index
  end

  def confirm
    @user = User.find(params[:user_id])
    @order = Order.new
    @orders = Order.all
    @items = Item.all.descendingOrder
    #@allTotal = Order.sumPrises(@orders)

    buy_cart_page_parameter = [
      {
        name: "さんま",
        process: "切り身",
        price: 100,
        num: 5
      }
    ]

    @buyings = @user.user_buyings(buy_cart_page_parameter)
    @allTotal = Order.sumPrises(@buyings)
  end

  def create
    #@users = User.all
    @user = User.find(params[:user_id])
    @order = Order.new(order_parameters)
    @allTotal = Order.sumPrises(@orders)
    @orders = Order.all

    # if params[:order_time].blank?
    #   flash[:danger] = "受け取り時間を選択してください。"
    #   render :confirm
    # end
    
        paramas[:orders].each do |param|
          user.orders.create(
            name: param[:name],
            process: param[:process],
            price: param[:price],
            num: param[:num]
          )
        end        
        #@order.save
        #Order.create(order_params)
        redirect_to customer_user_order_url, success: '商品を確定しました。'
    # else
    #   flash[:danger] = "商品確定ができませんでした。"
    #   render :confirm
    # end
  end

  def show
    @user = User.find(params[:user_id])
    @order = Order.find(params[:id])
    @allTotal = Order.sumtPrises(@orders)
  end


  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :process, :price, :num, :order_date, :order_time)
  end  

end
