class LogsController < ApplicationController

  def create
    set_project
    @log = @project.logs.new if current_user
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def log_params
    params.require(:log).permit(:title, :body)
  end


end
