class PoolsController < ApplicationController
  def create
    @pool = Pool.new(pool_params)

    return redirect_to @pool.project unless @pool.save
    redirect_to @pool.project, notice: 'Log was successfully posted.'

    # respond_to do |format|
    #   if @pool.save
    #     format.json { redirect_to @pool.project }
    #     format.html { redirect_to @pool.project, notice: 'Task was successfully created.' }
    #   else
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #     format.html { render @pool.project }
    #   end
    # end

  end

  private

  def pool_params
    params.require(:pool).permit(:goal, :pledged, :deadline, :project_id)
  end
end
