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
    # render plain: params[:book].inspect
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, success: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # def edit
  #   @book = Book.find(params[:id])
  # end
  # def show
  #   @book = Book.find(params[:id])
  # end

  def update
    # @book = Book.find(params[:id])
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, success: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # @book = Book.find(params[:id])

    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, danger: "Book was successfully destroyed." }
      format.json { head :no_content }
      format.js { render layout: false }
    end
  end

  private
  # def book_stock
  #   if @book.books_total > 0
  #     @book.status = 1
  #   else
  #     @book.status = 0
  #   end
  # end

  def load_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:isbn, :name, :desc, :author, :books_total, :status, :price, :category_id)
  end
end
