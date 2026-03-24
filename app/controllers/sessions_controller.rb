class SessionsController < ApplicationController
  def create
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
end
