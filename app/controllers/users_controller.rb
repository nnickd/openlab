class UsersController < ApplicationController
  def show
    @project = create_project
  end

  def create
    @user = User.new user_params
    return redirect_to root_path unless @user.save
    redirect_to root_path, notice: 'Created user'
  end

  private
  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end
end
