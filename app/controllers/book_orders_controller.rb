# frozen_string_literal: true

class BookOrdersController < ApplicationController
  before_action :load_book_order, only: [:show]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @book_orders = BookOrder.order(created_at: :desc).page params[:page]
    @book_order = BookOrder.new
  end

  def create
    @book_order = BookOrder.new(book_order_params)
    respond_to do |format|
      if @book_order.save
        @book_orders = BookOrder.order(created_at: :desc).page params[:page]

        format.html { redirect_to @book_order, success: "Book order was successfully created." }
        format.json { render :show, status: :created, location: @book_order }
        format.js {render :create}
      else
        format.html { render :new }
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
