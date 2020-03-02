# frozen_string_literal: true

class CreateBookCards < ActiveRecord::Migration[5.2]
  def change
    create_table :book_cards do |t|
      t.string :name
      t.date :return_date
      t.integer :price_borrow
      t.boolean :status

      t.timestamps
    end
    # add_reference :book_cards, :book_order, index: true, foreign_key: true
    # add_reference :book_cards, :book, index: true, foreign_key: true

  end
end
