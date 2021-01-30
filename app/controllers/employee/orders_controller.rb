class Employee::OrdersController <  Employee::MainController
 before_action :set_order, only:[:edit, :update]
  def index
    @orders = Order.all.timeSort.page(params[:page]).per(2)
  end

  def edit
  end

  def update
    @order.statusUpdate(params.keys[3])
    redirect_to employee_orders_url, info: '注文状況を更新しました。'
  end
  

  def show
    @user = User.find( params[:id] )
  end

private
  def set_order
    @order = Order.find( params[:id] )
  end
  
end
