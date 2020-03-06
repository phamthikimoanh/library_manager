class ChangeBookOrderStatus < ActiveRecord::Migration[5.2]
   def up
    change_table :book_orders do |t|
      t.change :status, :boolean,  :default => 0
    end
  end

  def down
    change_table :book_orders do |t|
      t.change :status, :boolean
    end
  end

end
