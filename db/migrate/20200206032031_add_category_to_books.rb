class AddCategoryToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :category, index: true, foreign_key: true
  end
end
