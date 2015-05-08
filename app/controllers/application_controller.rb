class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def index
  end
  
  def current_user
      return User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
