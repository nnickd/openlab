class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    # @payment = Payment.new
    @projects = Project.posted?.order('created_at DESC')
    @projects = @projects.search(params[:search]) if params[:search]
  end

  def show
    @image = Image.new
    @images = @project.images
    @payment = Payment.new
    @pool = Pool.new unless @project.pool
    @log = @project.logs.new if current_user == @project.user
    @logs = @project.logs.order('created_at DESC')
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
    params.require(:project).permit(:title, :about, :context, :significance, :goals, :image, :video, :posted)
  end
end
