class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]
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
    @user = User.find(params[:id])
    @reviews = Review.where(reviewee_id: @user.id)
    @reviewer = false
  end

  def current
    @user = current_user
    @history = false
    render 'show'
  end

  def history
    @user = current_user
    @history = true
    render 'show'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end