class Employee::UsersController < Employee::MainController
  def index
    @customer_users = User.customerUsers
    @employee_users = User.employeeUsesrs
  end

  def new
  end

  def edit
  end

  def show
  end

  def destroy
    User.find( params[:id] ).destroy
    redirect_to employee_users_path, danger: '削除しました。'
  end
  
end
