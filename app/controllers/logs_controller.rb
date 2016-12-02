class LogsController < ApplicationController
  def create
    @log = Log.new(log_params)

    respond_to do |format|
      if @log.save
        format.html { redirect_to @log.project, notice: 'Log was successfully posted.' }
      else
        format.html { redirect_to @log.project }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @log.update(update_log_params)
  #       format.html { redirect_to @log.project, notice: 'Project was successfully updated.' }
  #       # format.json { render :show, status: :ok, location: @project }
  #     else
  #       format.html { render :edit }
  #       # format.json { render json: @project.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # def destroy
  #   @log.destroy
  #   respond_to do |format|
  #     format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
  #     # format.json { head :no_content }
  #   end
  # end

  private

  # def set_log
  #   @log = Project.find_by_title(params[:id])
  # end

  def log_params
    params.require(:log).permit(:title, :body, :user_id, :project_id)
  end

end
