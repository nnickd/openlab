class PoolsController < ApplicationController
  def create
    @pool = Pool.new(pool_params)
    return redirect_to @pool.project unless @pool.save
    redirect_to @pool.project, notice: 'Pool was successfully posted.'
  end

  private

  def pool_params
    params.require(:pool).permit(:goal, :pledged, :deadline, :project_id)
  end
end
