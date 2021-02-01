class Employee::ProductSalesAmountsController < Employee::MainController

  def show
    @item = Item.find( params[:id] )
    @month = params[:month].present? ?Date.parse(params[:month]) : Date.today
    @orders = Order.saleByProduct(@item.name, @month)
    @graphDatas = Order.dayTotal(@orders)
    @current_month_sales = Order.currentMonthSales(@orders)
  end
end
