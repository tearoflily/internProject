class Employee::ProductsController < Employee::MainController
  def index
    @products = Product.all.datasort
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_parameters)
    if @product.save
      redirect_to employee_products_path, info: "店頭商品#{@product.name}を登録しました。"
    else
      render :new
    end
  end

  def edit
  end
private
  def product_parameters
    params.require(:product).permit( :name, :price, :stock )
  end
  
end
