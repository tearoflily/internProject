class Employee::ProductSalesNumbersController <  Employee::MainController
  def show
    @item = Item.find( params[:id] )
  end
end
