class RemoveReturnBookFromBookOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :book_orders, :return_date, :date
  end
end
