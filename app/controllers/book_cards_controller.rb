# frozen_string_literal: true

class BookCardsController < ApplicationController
  before_action :load_book_card, only: %i[show edit update check_status price_borrow]
  before_action :authenticate_user!, except: [:show, :index]
  # after_save :price_borrow, only: [:update]

  def index
    @book_cards_grid = BookCardsGrid.new(params[:book_cards_grid]) do |scope|
      scope.page(params[:page])
    end
    # binding.pry
    @book_cards = BookCard.all.page params[:page]
  end

  def update 
    respond_to do |format|
      if @book_card.update(book_card_params)
        # binding.pry
        check_status  
        price_borrow
        format.html { redirect_to @book_card, success: "Book card was successfully updated." }
        format.json { render :show, status: :ok, location: @book_card }
      else
        format.html { render :edit }
        format.json { render json: @book_card.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def check_status
    if @book_card.status == false
      @book_card.update_column(:status , 0)
      _book_stock = @book_card.book.books_total - 1
      @book_card.book.update_columns(:books_total => _book_stock, :status => 0)     
    else
      @book_card.update_column(:status, 1)
      _book_stock = @book_card.book.books_total + 1
      @book_card.book.update_columns(:books_total => _book_stock, :status => 1)
    end
  end

  def price_borrow
    book_order= @book_card.book_order
    if @book_card.status == true
      start_date = book_order.created_at
      end_date = Time.now
      cr_date = (start_date - end_date)/3600
      br_date = cr_date/24
      price_borrow = (br_date * 5000).to_i.abs
      # binding.pry
      @book_card.update_columns(:price_borrow => price_borrow, :status => 1)
    else
      @book_card.update_column(:price_borrow, 0)
    end
  end

  def load_book_card
    @book_card = BookCard.find(params[:id])
  end

  def book_card_params
    params.require(:book_card).permit(:status)
  end
end
