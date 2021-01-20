class Employee::ProcessingsController <  Employee::MainController
  def new
    @item = Item.find( params[:item_id] )
    @processings = Processing.findItem(@item.id).includes(:item)
  end

  def create
    @item = Item.find( params[:item_id] )
    @processings = Processing.findItem(@item.id).includes(:item)
    process_names = @item.processNames
    params[:name].each do |name|
  
      if name == ''
        next
      elsif process_names.exclude?(name) && name != ""
        @item.processings.create!( name: name)
        flash[:info] = '商品加工法を登録しました。'
      else 
        flash[:danger] = 'すでに登録されている加工法があります。'
      end
    end
    redirect_to new_employee_processing_url({params:{item_id: @item}})
  end

  def destroy
    processing = Processing.find( params[:id] )
    processing.destroy
    redirect_to new_employee_processing_url({params:{item_id: processing.item}}),danger: '加工法を削除しました。'
  end
  
end
