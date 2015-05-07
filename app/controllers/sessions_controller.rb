class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to return_point, notice: "You are now signed in"
    else
      flash[:error] = "Bad username or password"
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end