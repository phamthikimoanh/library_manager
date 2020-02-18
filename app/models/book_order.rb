class BookOrder < ApplicationRecord
    belongs_to :user
    has_many :book_cards, through: :books, dependent: :destroy
    accepts_nested_attributes_for :book_cards, reject_if: :all_blank, allow_destroy: true

    after_save :reduce_book_in_db

    def reduce_book_in_db
        book_order = BookOrder.last.id
        book_cards = BookCard.where("book_order_id = #{book_order}")

        # all_books = book_order.book_cards

        # all_books.each do |k|
        #     if k.book_id 
        # end
        # # puts "hi, save success!!"
        # BookCard.all.each do |book_card|
        #     # puts "hi, load book card #{book_card.book_id}"
        #     Book.all.each do  |book|
        #         if book_card.book_id ==  book.id
        #             book_stock =book.books_total - 1
        #             # binding.pry
        #             puts book_stock
        #             # puts "hi, load book card #{book_card.book_id} and #{ book.book_id}"
        #         end
        #     end
        # end
    end
end
