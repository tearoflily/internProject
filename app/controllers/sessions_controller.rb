class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email].dawncase)
    if user && user.authenticate(session_params[:password])
      log_in user
      session_params[:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
end
