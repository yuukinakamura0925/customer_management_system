class CategoriesController < ApplicationController
  def create
    category = Category.new(category_params)
    if category.save
      render json: { status: "success", data: category }
    else
      render json: { status: "error", data: category.errors }
    end
  end

  def index
    categories = Category.all
    render json: categories
  end

  def show
    category = Category.find(params[:id])
    render json: category
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      render json: { status: "success", data: category }
    else
      render json: { status: "error", data: category.errors }
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.destroy
      render json: { status: "success" }
    else
      render json: { status: "error", data: category.errors }
    end
  end

  private
  def category_params
    # params.require(:category).permit(:name)
    params.permit(:name)
  end
end
