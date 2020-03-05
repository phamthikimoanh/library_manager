# frozen_string_literal: true

class BookOrdersController < ApplicationController
  # before_action :load_book_order, only: [:show]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @book_orders_grid = BookOrdersGrid.new(params[:book_orders_grid]) do |scope|
      scope.page(params[:page])
    end
    @book_orders = BookOrder.all
    @book_order = BookOrder.new
  end

  def show
    @book_order = BookOrder.find(params[:id])
  end
  def create
    @book_order = BookOrder.new(book_order_params)
    respond_to do |format|
      if @book_order.save
        
        @book_orders = BookOrder.order(created_at: :desc).page params[:page]
        format.js {render :create}
        format.html { redirect_to @book_order, success: "Book order was successfully created." }
        format.json { render :show, status: :created, location: @book_order }
      else      
        
        # binding.pry
          
        @error_messages = @book_order.errors.full_messages
        format.js {}
        format.html { render :create }
        format.json { render json: @book_order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def load_book_order
    @book_order = BookOrder.find(params[:id])
  end

  def book_order_params
    params.require(:book_order).permit(
      :amount_book, :brorrow_date, :user_id,
      book_cards_attributes: %i[book_id name _destroy]
    )
  end
end
