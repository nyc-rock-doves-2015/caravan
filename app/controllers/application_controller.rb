class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_user_profile

  def index
  end

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user_profile
    user_path current_user
  end
end
