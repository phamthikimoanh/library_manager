# frozen_string_literal: true

class BookCardsController < ApplicationController
  before_action :load_book_card, only: %i[show edit update]

  def index
    @book_cards_grid = BookCardsGrid.new(params[:book_cards_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def update
    if @book_card.update(book_card_params)
      redirect_to book_cards_path
    else
      render "edit"
    end
  end

  private

  def load_book_card
    @book_card = BookCard.find(params[:id])
  end

  def book_card_params
    params.require(:book_card).permit(:status)
  end
end
