class ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    return redirect_to @image.project, notice: 'Image was successfully posted.' if @image.save
    redirect_to @image.project
  end

  private

  def image_params
    params.require(:image).permit(:pic, :project_id)
  end
end
