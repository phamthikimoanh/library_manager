# frozen_string_literal: true

class BookOrdersController < ApplicationController
  def index
    @book_orders = BookOrder.all
    @book_order = BookOrder.new
  end
  # def new
  #   @book_order = BookOrder.new
  # end

  def create
    @book_order = BookOrder.new(book_order_params)

    respond_to do |format|
      if @book_order.save
        format.html { redirect_to @book_order, notice: 'Book order was successfully created.' }
        format.js   {}
      else
        format.html { render :new }
        format.json { render json: @book_order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def book_order_params
    params.require(:book_order).permit(
      :amount_book, :brorrow_date, :user_id
    )
  end
end
