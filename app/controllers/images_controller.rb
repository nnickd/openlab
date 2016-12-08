class ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    return redirect_to @image.project unless @image.save
    redirect_to @image.project, notice: 'Image was successfully posted.'
  end

  private

  def image_params
    params.require(:image).permit(:pic, :project_id)
  end
end
