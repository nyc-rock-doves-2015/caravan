class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    # wrong
    if user.save
      session[:user_id] = user.id
      redirect_to return_point, notice: "You are now signed in"
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end