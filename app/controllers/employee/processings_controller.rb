class Employee::ProcessingsController <  Employee::MainController
  def new
    @item = Item.find( params[:item_id] )
  end
  def create
    @item = Item.find( params[:item_id] )
    debugger
  end
  
end
