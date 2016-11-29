class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    return render :new unless @user
    session[:user_id] = @user.id
    redirect_to users_path
  end

  def home
    session.delete(:user_id)
    @current_user = nil
  end

end
