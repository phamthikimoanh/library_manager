# frozen_string_literal: true

class BooksController < ApplicationController
  # before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all.page params[:page]
    @book = Book.new

    # @data_grid = prepare_grid do |grid|
    #     grid.add_column :auto
    #     grid.add_column :isbn, :title => 'Code Book', :sortable => true
    #     grid.add_column :name, :title => 'Name', :sortable => true
    #     grid.add_column :desc, :title => 'Description', :sortable => true, :filter => :text
    #     grid.add_column :author, :title => 'Author', :sortable => true

    #     grid.initial_sort = "books.created_at DESC"

    #     grid.data = Book.scoped
    # end
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    # render plain: params[:book].inspect
    @book = Book.new(book_params)

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
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render 'index'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  private

  def book_params
    params.require(:book).permit(:isbn, :name, :desc, :author, :book_total, :category_id)
  end
end
