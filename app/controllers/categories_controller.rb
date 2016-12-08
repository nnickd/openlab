class CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :destroy]

  def create
    @category = Category.new(category_params)
    if @category.save
      @categories_projects = CategoriesProjects.new(category_id: @category.id, project_id: params[:project_id].to_i)
      return redirect_to @categories_projects.project, notice: 'Category was successfully posted.' if @categories_projects.save
    end
    redirect_to refresh_page
  end

  def update
    return redirect_to @category.project unless @category.update(update_category_params)
    redirect_to @category.project notice: 'Category was successfully updated.'
  end

  def destroy
    @category.destroy
    redirect_to projects_url, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:science)
  end
end
