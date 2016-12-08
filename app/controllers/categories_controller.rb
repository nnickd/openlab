class CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :destroy]

  def create
    @category = Category.new(category_params)
    return redirect_to @category.project unless @category.save
    redirect_to @category.project, notice: 'Category was successfully posted.'
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
    params.require(:category).permit(:science, :project_id)
  end
end
