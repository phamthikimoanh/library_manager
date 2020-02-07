# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.all
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

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    # render plain: params[:book].inspect
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path

    else

    #   binding.pry
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:isbn, :name, :desc, :author, :book_total, :category_id)
  end
end
