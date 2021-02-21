class TopController < ApplicationController
  def show
    @products = Product.all.datasort
    #@item = topImage(name: name)
  end
end