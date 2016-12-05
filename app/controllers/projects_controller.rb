class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    # @payment = Payment.new
    @projects = Project.posted?.order('created_at DESC')
    @projects = @projects.search(params[:search]) if params[:search]
  end

  def show
    @payment = Payment.new
    @pool = Pool.new unless @project.pool
    @log = @project.logs.new
    @logs = @project.logs.order('created_at DESC')
    @image = Image.new
    @images = @project.images
    @video = @project.video ? @project.video : Video.new
  end

  def create
    @project = current_user.projects.new(create_project_params)
    return refresh_page unless @project.save
    redirect_to @project, notice: "project successfully created"
  end

  def update
    return refresh_page unless @project.update(update_project_params)
    redirect_to @project, notice: "project successfully updated"
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'project successfully destroyed'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def create_project_params
    params.require(:project).permit(:title, :posted)
  end

  def update_project_params
    params.require(:project).permit(:title, :about, :context, :significance, :goals, :image, :posted)
  end
end
