class UsersController < ApplicationController
<<<<<<< HEAD

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: "You are now signed in"
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

=======
  def new
  end

  def create

  end

  def index
  end

  def show
    @user = User.find(1)
  end
>>>>>>> Add users controller for dummy layout show
end