class ChangeBookCardStatus < ActiveRecord::Migration[5.2]
  def up
    change_table :book_cards do |t|
      t.change :status, :boolean,  :default => 0
    end
  end

  def down
    change_table :products do |t|
      t.change :status, :boolean
    end
  end
end
