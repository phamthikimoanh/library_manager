# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :load_book, only: [:show, :edit, :update, :destroy]

  def index
    # @books = Book.all.page params[:page]
    @book = Book.new

    @books_grid = BooksGrid.new(params[:books_grid]) do |scope|
      scope.page(params[:page])  
    end
  end


  def create
    @book = Book.new(book_params)

    # render plain: params[:book].inspect
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.js   {}
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render 'index'
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  private
  def load_book
    @book = Book.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:isbn, :name, :desc, :author, :book_total, :category_id)
  end
end
