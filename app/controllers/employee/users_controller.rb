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

  def show
  end

  def destroy
    User.find( params[:id] ).destroy
    redirect_to employee_users_url, danger: '削除しました。'
  end
  
end
