class Employee::OrdersController <  Employee::MainController
  def index
    @orders = Order.all.timeSort
  end

  def edit
  end

  def show
  end
end
