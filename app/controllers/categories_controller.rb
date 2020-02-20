# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :load_category, only: [:edit, :update]

  def index
    # @categories = Category.all.page params[:page]
    @category = Category.new
    @categories_grid = CategoriesGrid.new(params[:categories_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render "edit"
    end
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Category was successfully created." }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def load_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
