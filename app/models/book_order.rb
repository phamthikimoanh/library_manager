# frozen_string_literal: true

class BookOrder < ApplicationRecord
  belongs_to :user
  has_many :book_cards, dependent: :destroy
  accepts_nested_attributes_for :book_cards, reject_if: :all_blank, allow_destroy: true
  validates :amount_book, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 },presence: true
  validates :brorrow_date, presence: true
  validates :user_id, presence: true

  max_paginates_per 5

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
            
      if book_stock >= 1
        book.update_columns(:books_total => book_stock, :status => 1)
      else       
        book.update_columns(:books_total => 0, :status => 0)
      end
    end
  end
end
