class Employee::ProductSalesNumbersController <  Employee::MainController
  def show
    @item = Item.find( params[:id] )
    @month = params[:month].present? ?Date.parse(params[:month]) : Date.today
    orders = Order.saleByProduct(@item.name, @month)
    @graphDatas = Order.salesCountArray(orders)
    @table_datas = Order.salesQuantityTable(orders, @month)
    @total_numbers = Order.totalNumber(orders)
  
  end
end
