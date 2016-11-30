class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :create_project

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def create_project
    @project = current_user.projects.new if current_user
  end

  def require_logged_in
    return true if current_user
    return redirect_to root_path
  end
end
