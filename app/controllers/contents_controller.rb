class ContentsController < ApplicationController
  before_action :set_content, only: [:update, :destroy]
  before_action :set_project, only: [:create]

  def create
    @content = Content.new(content_params)
    @content.project = @project
    return redirect_to @content.project unless @content.save
    redirect_to @content.project, notice: 'Content was successfully posted.'
  end

  def update
      return redirect_to @content.project unless @content.update(update_content_params)
      redirect_to @content.project notice: 'Content was successfully updated.'
  end

  def destroy
    @content.destroy
    redirect_to projects_url, notice: 'Content was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:body, :kind)
  end
end
