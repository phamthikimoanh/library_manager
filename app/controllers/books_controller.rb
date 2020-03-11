# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :load_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @book = Book.new
    @books_grid = BooksGrid.new(params[:books_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    respond_to do |format|
      if @book.save
        @books_grid = BooksGrid.new(params[:books_grid]) do |scope|
          scope.page(params[:page])
        end
        format.html { redirect_to @book, success: "Book was successfully created." }
        format.js{ render :create }
        format.json { render :show, status: :created, location: @book }
      else
        @error_messages = @book.errors.full_messages
        format.js {}
        format.html { render :create }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.js {}
        format.html { redirect_to @book, success: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.js {}
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, danger: "Book was successfully destroyed." }
      format.json { head :no_content }
      format.js { render layout: false }
    end
  end

  private

  def load_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:isbn, :name, :desc, :author, :books_total, :status, :price, :category_id, :image)
  end
end
