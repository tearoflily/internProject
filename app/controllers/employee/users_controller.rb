class Employee::UsersController < Employee::MainController

  def index
    @customer_q = User.customerUsers.ransack( params[:q] )
    @employee_q =  User.employeeUsesrs.ransack( params[:q] )
    @customer_users = @customer_q.result(distinct: true)
    @employee_users = @employee_q.result(distinct: true)

    if params[:customer].present?
      @customer_q = User.customerUsers.ransack( params[:q] )
      @customer_users = @customer_q.result(distinct: true)
      @employee_users = User.employeeUsesrs
    elsif params[:employee].present?
      @employee_q =  User.employeeUsesrs.ransack( params[:q] )
      @employee_users = @employee_q.result(distinct: true)
      @customer_users = User.customerUsers
    else
     
    end
  end

  def new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to employee_items_url, success: '新規登録に成功しました。'
    else
      render :new
    end
  end

	def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
　		redirect_to @user, success: "ユーザー情報を更新しました。"
    else
      render :edit      
    end
	end

  def show
  end

  def destroy
    User.find( params[:id] ).destroy
    redirect_to employee_users_url, danger: '削除しました。'
  end
  
end
