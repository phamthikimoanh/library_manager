class AddBookStockToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :book_stock, :integer
  end
end
