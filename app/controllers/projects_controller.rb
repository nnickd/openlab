class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.where(posted: true)
    @projects = if params[:search]
                  @projects.search(params[:search]).order('created_at DESC')
                else
                  @projects.order('created_at DESC')
                end
  end

  def show
    @payment = Payment.new 
    @pool = Pool.new unless @project.pool
    @log = @project.logs.new if current_user == @project.user
    @logs = @project.logs.order('created_at DESC')
  end

  def create
    @project = current_user.projects.new(create_project_params)
    return redirect_back(fallback_location: :fallback_location) unless @project.save
    redirect_to @project, notice: 'Project was successfully created.'
  end

  def update
    return redirect_back(fallback_location: :fallback_location) unless @project.update(update_project_params)
    redirect_to @project, notice: 'Project was successfully updated.'
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def create_project_params
    params.require(:project).permit(:title, :posted)
  end

  def update_project_params
    params.require(:project).permit(:title, :about, :context, :significance, :goals, :posted)
  end
end
