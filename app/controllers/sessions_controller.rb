class SessionsController < ApplicationController
  def index
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Sucessfully registered account"
    else
      redirect_to registration_path, alert: "Failed please check carefully"
    end
  end
  def check
    user = User.find_by(username: params[:username])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "Sucessfull logged in"
    else
      redirect_to root_path, alert: "Failded check username and password"
    end
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
