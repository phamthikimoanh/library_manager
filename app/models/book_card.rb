# frozen_string_literal: true

class BookCard < ApplicationRecord
  belongs_to :book_order
  belongs_to :book
  max_paginates_per 5

  after_save :check_status

  def check_status
    if self.status != true
      # binding.pry
      self.update_column(:status, 0)
      book_stock = book.books_total - 1
      book.update_column(:books_total, book_stock)
      
    else
      self.update_column(:status, 1)
      book_stock = book.books_total + 1
      book.update_column(:books_total, book_stock)
    end
  end
end
