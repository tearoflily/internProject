class Employee::ProductMultiplesController < Employee::MainController

  def new
    @form = Form::ItemCollection.new
    @number = Form::ItemCollection.number
  end

  def create
    @form = Form::ItemCollection.new(item_collection_parameters)
    @number = Form::ItemCollection.number
    if @form.save
      redirect_to root_url,success: '登録しました。'
    else
      flash.now[:danger] = "失敗"
      render :new
    end
   
  end

  def rows
    @form = Form::ItemCollection.new
    @number = Form::ItemCollection.number
      if params[:plus] == "true"
        Form::ItemCollection.addNum(@number)
        redirect_to new_employee_product_multiple_path
      elsif params[:plus] == "false"
        Form::ItemCollection.downNum
        redirect_to new_employee_product_multiple_path
      end
  end
private
  def item_collection_parameters
    params.require(:form_item_collection).permit(items_attributes: [:image, :name, :category, :info])
  end

end
