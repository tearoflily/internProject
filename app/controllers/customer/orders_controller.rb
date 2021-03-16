class Customer::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show index  edit update destroy  ]

  def index
  end

  def confirm
    @user = User.find(params[:user_id])
    @order = Order.new
    @orders = Order.all
    @items = Item.all.descendingOrder
   
    buy_cart_page_parameter=[
      {name: "さんま",
        process: "切り身",
        price: 100,
        num: 5
      },
      {
        name: "いか",
        process: "切り身",
        price: 100,
        num: 2
      }
    ]

    @buyings = @user.user_buyings(buy_cart_page_parameter)
    @allTotal = Order.sumPrises(@buyings)
  end

  def create
    @user = User.find(params[:user_id])

    if params[:order_time] == ""
      flash[:danger] = "受け取り時間を選択してください。"
      #render :confirm
      redirect_to confirm_customer_user_orders_url
    else
        params.each do |param|
          @user.orders.create(
            name: "param[:name]",
            process: "param[:process]",
            price: "param[:price]",
            num: "param[:num]",
            order_date: "param[:order_date]",
            order_time: "param[:order_time]",
            user_id: "params[:user_id]"
          )
        end        
        # if @order.save
           #Order.create(params)
          
           redirect_to customer_user_order_url(@user), success: '商品を確定しました。'
        # else
        #   flash[:danger] = "商品確定ができませんでした。"
        #   #render :confirm
        #   redirect_to confirm_customer_user_orders_url
        # end
       end
      
  end

   def update
   end

  def show
    @user = User.find(params[:user_id])
    @order = Order.find(params[:id])
    @allTotal = Order.sumPrises(@orders)
  end


  private

  def set_order
    @order = Order.find(params[:id])
  end

  #  def order_params
  #    params.permit(:name, :process, :price, :num, :order_date, :order_time, :user_id)
  #  end  

end
