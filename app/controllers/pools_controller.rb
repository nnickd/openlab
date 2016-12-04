class PoolsController < ApplicationController
  def create
    @pool = Pool.new(pool_params)
    return redirect_to @pool.project, notice: 'Log was successfully posted.' if @pool.save
    redirect_to @pool.project
  end

  private

  def pool_params
    params.require(:pool).permit(:goal, :pledged, :deadline, :project_id)
  end
end
