class Employee::ProductsController < Employee::MainController
  def index
    @products = Product.all.datasort
  end

  def new
    @product = Product.new
  end

  def create
    item = Item.find_by(name:  product_parameters[:name]) 
    process = item.itemProcesses 
    sale_date = Date.today + 1
    @product = Product.new(
       name:  product_parameters[:name],
       price: product_parameters[:price],
       process: process,
       seles_date: sale_date,
       stock: product_parameters[:stock]
    )
    if @product.save
      redirect_to employee_products_path, info: "店頭商品#{@product.name}を登録しました。"
    else
      render :new
    end
  end

  def update
    Product.stock_price_update(status_change_parameter)
    redirect_to employee_products_path, info: "編集しました。" 
  end
  

  def destroy
    Product.find( params[:id] ).destroy
    redirect_to employee_products_path, danger: "削除しました。" 
  end


private
  def product_parameters
    params.require(:product).permit( :name, :price, :stock )
  end

  def status_change_parameter
    params.require(:product).permit(products: [:price, :stock])[:products]
  end
  
  
  
end
