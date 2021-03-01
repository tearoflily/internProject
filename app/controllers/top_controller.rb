class TopController < ApplicationController
  def show
    @products = Product.all.datasort.page(params[:page]).per(6)
    @items = Item.all.descendingOrder
  end
  
end