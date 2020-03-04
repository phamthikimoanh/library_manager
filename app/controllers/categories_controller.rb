# frozen_string_literal: true
class CategoriesController < ApplicationController
  before_action :load_category, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    # @categories = Category.all.page params[:page]
    @category = Category.new
    @categories_grid = CategoriesGrid.new(params[:categories_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  # def show
  #   @category = Category.find(params[:id])
  # end
  # def edit
  #   @category = Category.find(params[:id])
  # end
  def update
    # @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update(category_params)
        format.js {}
        format.html { redirect_to @category, success: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.js {}
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end
  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        @categories_grid = CategoriesGrid.new(params[:categories_grid]) do |scope|
          scope.page(params[:page])
        end
        format.js {}
        format.html { redirect_to @category, success: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
        
      else   
        format.js {}    
        format.html { render :create }
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
