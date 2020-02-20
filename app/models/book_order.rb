# frozen_string_literal: true

class BookOrder < ApplicationRecord
  belongs_to :user
  has_many :book_cards, dependent: :destroy
  accepts_nested_attributes_for :book_cards, reject_if: :all_blank, allow_destroy: true
  validate :validate_book_in_db
  max_paginates_per 5

  def validate_book_in_db
    could_borrow = true
    err = ""
    book_cards.each do |book_card|
      book = book_card.book
      if book.books_total <= 0
        could_borrow = false
        err += "#{book.name}, "
      end
    end
    return true if could_borrow == true

    errors[:base] << "#{err} : outs book"
  end

  after_save :sum_deposits
  before_save :reduce_book_in_db

  def sum_deposits
    book_order = BookOrder.last
    sum = 0
    book_cards.each do |book_card|
      book = book_card.book
      sum += book.price
    end
    puts "Tong tien dat coc la: #{sum}"
    # binding.pry
    book_order.update_column(:deposits, sum)
  end

  def reduce_book_in_db
    # return if errors.any?
    # status = 1
    book_cards.each do |book_card|
      book = book_card.book
      book_stock = book.books_total - 1

      if book_stock > 0
        book.update_attribute(:books_total, book_stock)
        # book_order.update_attribute(:deposits, sum)
      end
    end
  end
end
