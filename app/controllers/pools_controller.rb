class PoolsController < ApplicationController
  def create
    @pool = Pool.new(pool_params)

    respond_to do |format|
      if @pool.save
        format.html { redirect_to @pool.project, notice: 'Log was successfully posted.' }
      else
        format.html { redirect_to @pool.project }
      end
    end
  end

  private

  def pool_params
    params.require(:pool).permit(:goal, :deadline, :project_id)
  end
end
