class Employee::ItemImageController < ApplicationController
  def show
    @item = Item. find(params[:id])
    send_data @item.image, :type => 'image/jpeg', :disposition => 'inline'
  end
end
