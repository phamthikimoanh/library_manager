# frozen_string_literal: true

class BookCardsController < ApplicationController
  def index
    # @book_cards = BookCard.all
    @book_cards_grid = BookCardsGrid.new(params[:book_cards_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def show
    @book_card = BookCard.find(params[:id])
  end

  def edit
    @book_card = BookCard.find(params[:id])
  end

  def update
    @book_card = BookCard.find(params[:id])

    if @book_card.update(book_card_params)
      redirect_to book_cards_path
    else
      render 'edit'
    end
  end

  private

  def book_card_params
    params.require(:book_card).permit(:status)
  end
end
