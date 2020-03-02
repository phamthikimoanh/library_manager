# frozen_string_literal: true
require 'date'
class BookCard < ApplicationRecord
  belongs_to :book_order
  belongs_to :book
  max_paginates_per 5
  validates :status, default: false
  # after_save :check_status
  # after_save :price_borrow

  # def check_status
  #   if self.status != true
  #     self.update_column(:status, 0)
  #     _book_stock = book.books_total - 1
  #     # book.update_column(:books_total, book_stock)
  #     book.update_columns(:books_total => _book_stock, :status => 0)

      
  #   else
  #     self.update_column(:status, 1)
  #     _book_stock = book.books_total + 1
  #     # book.update_column(:books_total, book_stock)
  #     book.update_columns(:books_total => _book_stock, :status => 1)

  #   end
  # end

  # def price_borrow
  #   start_date = book_order.created_at
  #   end_date = Time.now
  #   cr_date = (start_date - end_date)/3600
  #   br_date = cr_date/24
  #   price_borrow = (br_date * 5000).to_i.abs
  #   self.update_column(:price_borrow, price_borrow)
  # end
end
