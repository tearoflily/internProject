class Employee::ProductsChangeController < Employee::MainController
  def index
    @products = Product.all.datasort
  end
end
