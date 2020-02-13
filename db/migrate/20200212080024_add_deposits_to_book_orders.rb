class AddDepositsToBookOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :book_orders, :deposits, :integer
  end
end
