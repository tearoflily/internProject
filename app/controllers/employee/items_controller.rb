class Employee::ItemsController <  Employee::MainController
  before_action :setItem, only: [ :show, :edit, :update, :destoroy ]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_parameters)
    if @item.save
      redirect_to employee_items_url, notice: "#{@item.name}を登録しました。"
    else
      render :new
    end
  end


  def edit
  end


  def update
  end

  def destroy
  end

  def show
  end

private
  def item_parameters
    params.require(:item).permit( :path, :name, :category, :info )
  end

  def setItem
    @item = Item.find( params[:id] )
  end
end
