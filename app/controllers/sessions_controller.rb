class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to top_show_url, success: 'ログインしました'
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to top_show_url, success: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end


end
