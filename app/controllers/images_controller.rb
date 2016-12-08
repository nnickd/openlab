class ImagesController < ApplicationController
  before_action :set_project

  def create
    @image = Image.new(image_params)
    @image.project = @project
    return redirect_to @project unless @image.save
    redirect_to @project, notice: 'Image was successfully posted.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def image_params
    params.require(:image).permit(:pic)
  end
end
