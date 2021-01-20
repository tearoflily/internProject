class Employee::ItemsController <  Employee::MainController
  before_action :setItem, only: [ :show, :edit, :update, :destroy ]

  def index
    @items = Item.all.descendingOrder
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_parameters)
    @item.image = @item.imageSet(item_parameters[:image])
    if @item.save
      redirect_to employee_items_url,  info: "#{@item.name}を登録しました。"
    else
      render :new
    end
  end


  def edit
  end


  def update
    if @item.update_attributes(item_parameters)
      redirect_to employee_items_url,  info: "#{@item.name}を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to employee_items_url,  danger: "削除しました。"
  end

  def show
  end

private
  def item_parameters
    params.require(:item).permit( :image, :name, :category, :info )
  end

  def setItem
    @item = Item.find( params[:id] )
  end

 
end
