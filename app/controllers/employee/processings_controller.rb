class Employee::ProcessingsController <  Employee::MainController
  def new
    @item = Item.find( params[:item_id] )
  end
end
