class UsersController < ApplicationController
  def show
    user_create_project
    projects_logs_payments
  end

  def create
    create_user user_params
    return redirect_to root_path unless @user.save
    redirect_to root_path, notice: 'Created user'
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end

  def user_create_project
    @project = @current_user.projects.new if current_user
  end

  def projects_logs_payments
    @projects = current_user.projects
    @logs = current_user.logs
    @payments = current_user.payments
  end
end
