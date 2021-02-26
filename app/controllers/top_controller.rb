class TopController < ApplicationController
  def show
    @products = Product.all.datasort
    @items = Item.all.descendingOrder.page(params[:page]).per(6)
  end
end