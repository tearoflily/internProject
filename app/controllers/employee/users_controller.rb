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
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])

  end

  

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to employee_users_url, success: '新規登録に成功しました。'
    else
      render :new
    end
  end

	def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to employee_users_url, success: "従業員情報を更新しました。"
    else
      render :edit      
    end
	end

  def show
    @user = User.find(params[:id])
    redirect_to customer_user(@user) unless @user.employee?
    
  end

  def destroy
    User.find( params[:id] ).destroy
    redirect_to employee_users_url, danger: '削除しました。'
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :tellnumber, :email, :password, :password_confirmation, :employee)
  end



end
