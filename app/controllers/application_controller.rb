class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_user_profile
  helper_method :authenticate_user!
  helper_method :set_return_point
  helper_method :return_point

  def index
    render layout: 'landing-page'
  end

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user_profile
    user_path current_user
  end

  def authenticate_user!(return_point = request.url)
    unless current_user
      set_return_point(return_point)
      redirect_to signin_path
    end
  end

  def set_return_point(path, overwrite = false)
    if overwrite || session[:return_point].blank?
      session[:return_point] = path
    end
  end

  def return_point
    session[:return_point] || root_path
  end
end
