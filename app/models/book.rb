# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category
  max_paginates_per 5
  validates :name, presence: true, length: { maximum: 30 }
  validates :desc, presence: true
  mount_uploader :image, ImageUploader

  def book_count
    group_book_by_ids = BookCard.group(:book_id).count
    books = Book.all

    books.each do |book|
      group_book_by_ids.each do |k,v|
        # binding.pry
        if book.id == k
          # puts "book_id dang = k : #{k}"
           book_stock = book.books_total - v
          if book_stock > 0
            return "Stock #{book_stock}"
          else
            return "Out stock"
          end
        end      
      end
    end
  end
end
