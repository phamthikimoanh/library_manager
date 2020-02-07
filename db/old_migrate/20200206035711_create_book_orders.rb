class CreateBookOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :book_orders do |t|
      t.integer :amount_book
      t.date :brorrow_date
      t.date :return_date
      t.boolean :status

      t.timestamps
    end
  end
end
