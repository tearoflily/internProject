class Employee::SalesManagementsController < Employee::MainController

  def index
    @month = params[:month].present? ?Date.parse(params[:month]) : Date.today
    @datas = Order.saleAllproduct(params[:month])
    @graph_datas = Order.dayTotal(@datas,params[:month])
    @current_month_sales = Order.currentMonthSales(@datas)
  end
end
