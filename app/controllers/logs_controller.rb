class LogsController < ApplicationController
  before_action :set_log, only: [:update, :destroy]
  before_action :set_project

  def create
    @log = Log.new(log_params)
    @log.project = @project
    return redirect_to @project unless @log.save
    redirect_to @project, notice: 'Log was successfully posted.'
  end

  def update
    return redirect_to @project unless @log.update(log_params)
    redirect_to @project, notice: 'Log was successfully updated.'
  end

  def destroy
    @log.destroy
    redirect_to @project, notice: 'Log was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_log
    @log = Log.find(params[:id])
  end

  def log_params
    params.require(:log).permit(:title, :body)
  end
end
