class Employee::ProductSalesNumbersController <  Employee::MainController
  def show
    @item = Item.find( params[:id] )
    @month = params[:month].present? ?Date.parse(params[:month]) : Date.today
    orders = Order.saleByProduct(@item.name, @month)
    
    @graphDatas = Order.salesCountArray(orders)
  end
end
