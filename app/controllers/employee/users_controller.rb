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
end
