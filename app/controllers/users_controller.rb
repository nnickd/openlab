class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new user_params
    return render :new unless @user.save
    redirect_to new_sessions_path, notice: 'Created user'
  end

  private
  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end
end
