class AddBookOrderToBookCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :book_cards, :book_order, foreign_key: true
  end
end
