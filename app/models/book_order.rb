# frozen_string_literal: true

class BookOrder < ApplicationRecord
  belongs_to :user
  has_many :book_cards, dependent: :destroy
  accepts_nested_attributes_for :book_cards, reject_if: :all_blank, allow_destroy: true
  validate :validate_book_in_db
  max_paginates_per 5
  validates :amount_book, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 },presence: true
  validates :brorrow_date, presence: true

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
    book_order.update_column(:deposits, sum)
  end

  def reduce_book_in_db
    book_cards.each do |book_card|
      book = book_card.book
      book_stock = book.books_total - 1
      
      # binding.pry
      
      if book_stock <= 0
        book.update_column(:books_total, 0)        
        book.update_column(:status, false)
      else
        book.update_column(:books_total, book_stock)    
        book.update_column(:status, true)    
      end
    end
  end
end
