class AddBookIdToBookCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :book_cards, :book, foreign_key: true
  end
end
