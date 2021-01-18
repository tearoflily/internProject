class Employee::ProcessingsController < ApplicationController
  def new
    @item = Item.find( params[:item_id] )
  end
end
