class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :create_user
  layout :decide_layout

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def create_user(params)
    @user = User.new(params)
  end

  def decide_layout
    current_user ? "logged_in" : "application"
  end

  def require_logged_in
    return true if current_user
    return redirect_to root_path
  end

  def refresh_page
    redirect_back(fallback_location: :fallback_location)
  end
end
