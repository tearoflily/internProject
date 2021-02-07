class Customer::UsersController < Customer::MainController
	# before_action :logged_in_user, only: [:show, :edit, :update]
  # before_action :correct_user, only: [:edit, :update]
	
	def index
	end
	
	def show
		@user = User.where(employee: false).find(params[:id])
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
      redirect_to top_show_url, success: '新規登録に成功しました。'
    else
      render :new
    end
  end

	def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to customer_user_url(@user), success: "お客様情報を更新しました。"
    else
      render :edit      
    end
	end

	def destroy
  end
  

  private

    def user_params
      params.require(:user).permit(:name, :name_kana, :tellnumber, :email, :password, :password_confirmation, :employee)
    end
    
end