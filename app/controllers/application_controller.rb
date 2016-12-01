class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :create_user, :create_project, :create_log

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def create_user(params)
    @user = User.new(params)
  end

  def current_project
    @current_project ||= Project.find_by(id: params[:id]) if current_page?(:controller => 'projects')
  end

  def create_project
    @project = current_user.projects.new if current_user
  end

  def create_log(params)
    @log = Log.new(params)
  end

  def require_logged_in
    return true if current_user
    return redirect_to root_path
  end
end
