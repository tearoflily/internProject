class Employee::SalesManagementsController < Employee::MainController

  def index
    @month = params[:month].present? ?Date.parse(params[:month]) : Date.today
    @datas = Order.saleAllproduct(params[:month])
    @graph_datas = Order.dayTotal(@datas,params[:month])
    @current_month_sales = Order.currentMonthSales(@datas)
    respond_to do |format|
      format.html
      format.xlsx do
        response.headers['Content-Disposition'] = "attachment; filename=#{Date.today.strftime('%Y年/%-m/%d')}売上.xlsx"
      end
    end
  end
end
