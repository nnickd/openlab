class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.posted?.order('created_at DESC')
    @projects = @projects.search(params[:search]) if params[:search]
  end

  def show
    @category = @project.categories.new

    @video = @project.video ? @project.video : Video.new
    @content = @project.contents.new
    @image = @project.images.new
    @log = @project.logs.new
    @payment = Payment.new
    @pool = Pool.new
  end

  def create
    @project = current_user.projects.new(project_params)
    return refresh_page unless @project.save
    redirect_to @project, notice: "project successfully created"
  end

  def update
    return refresh_page unless @project.update(project_params)
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

  def project_params
    params.require(:project).permit(:title, :posted)
  end

end
