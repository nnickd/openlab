class LogsController < ApplicationController
  def create
    create_log log_params

    respond_to do |format|
      if @log.save
        format.html { redirect_to @log.project, notice: 'Log was successfully posted.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { redirect_to @log.project }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def log_params
    params.require(:log).permit(:title, :body, :user_id, :project_id)
  end
end
