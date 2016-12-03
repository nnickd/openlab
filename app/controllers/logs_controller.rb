class LogsController < ApplicationController
  before_action :set_log, only: [:update, :destroy]
  def create
    @log = Log.new(log_params)
    return redirect_to @log.project, notice: 'Log was successfully posted.' if @log.save
    redirect_to @log.project
  end

  def update
    if @log.update(update_log_params)
      return redirect_to @log.project, notice: 'Log was successfully updated.' if @log.save
      redirect_to @log.project
    end
  end

  def destroy
    @log.destroy
    redirect_to projects_url, notice: 'Log was successfully destroyed.'
  end

  private

  def set_log
    @log = Log.find_by_title(params[:id])
  end

  def log_params
    params.require(:log).permit(:title, :body, :user_id, :project_id)
  end
end
