class LogsController < ApplicationController
  before_action :set_log, only: [:update, :destroy]
  def create
    @log = Log.new(log_params)
    return redirect_to @log.project unless @log.save
    redirect_to @log.project, notice: 'Log was successfully posted.'
  end

  def update
      return redirect_to @log.project unless @log.update(update_log_params)
      redirect_to @log.project notice: 'Log was successfully updated.'
  end

  def destroy
    @log.destroy
    redirect_to projects_url, notice: 'Log was successfully destroyed.'
  end

  private

  def set_log
    @log = Log.find(params[:id])
  end

  def log_params
    params.require(:log).permit(:title, :body, :project_id)
  end
end
