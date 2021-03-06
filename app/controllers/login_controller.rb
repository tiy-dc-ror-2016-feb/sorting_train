class LoginController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user && @user.password == user_params[:password]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil if current_user
    redirect_to login_path
  end

  def user_params
    params.permit(:email, :password)
  end
end
